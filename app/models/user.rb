class User < ActiveRecord::Base
  has_many :registrations
  has_many :events, :through => :registrations

  has_attached_file :photo,
                    :styles => { :large => "150x150#", :medium => "100x100#", :thumb => "83x83#", :tiny => "25x25#" },
                    :url => "/system/:class/:attachment/:id/:style.:extension",
                    :path => ":rails_root/public:url"

validates_attachment_content_type :photo,
                                    :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif', 'image/pjpeg','image/x-png'],
                                    :if => Proc.new {|profile| profile.photo.file?},
                                    :message => 'profile.photo_content_type'
  validates_presence_of :first_name, :last_name, :phone, :experience, :user_type, :member, :emergency_contact
  validates_format_of :phone, :with => /^\d{10}$/
  before_validation :standardize_phone_number

  acts_as_authentic do |config|
    # Add custom configuration options here
    config.crypto_provider = Authlogic::CryptoProviders::Sha1
  end

  def standardize_phone_number
    self.phone = self.phone.gsub(/[^0-9]/, '')
  end

  def full_name
    self.first_name + ' ' + self.last_name
  end
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.password_reset_instructions(self).deliver
  end
  validates_format_of :first_name, :with => /^[a-zA-Z ]+$/, :message => "(Names can only contain letters)"
#  validates_format_of :last_name, :with => /^[a-zA-Z ]+$/, :message => "(Names can only contain letters)"
#  validates_format_of :phone_cell, :with => /^(1?(-?\d{3})-?)?(\d{3})(-?\d{4})$/, :message => "Use this phone number format: XXX-XXX-XXXX"
#  validates_format_of :phone_evening, :with => /^(1?(-?\d{3})-?)?(\d{3})(-?\d{4})$/, :message => "Use this phone number format: XXX-XXX-XXXX"
#  validates_presence_of :experience, :exercise, :medical, :emergency_contact, :diet


  def compound_status(event)

    registrations = Registration.where(:user_id => self.id, :event_id => event.id)
    unless registrations.empty?
      reg = registrations.first
      if event.registrar_id == self.id
        if reg.register_status == "leader"
          return "leader, registrar"
        elsif reg.register_status == "coleader"
          return "coleader, registrar"
        else
          return "registrar"
        end
      end
      return reg.register_status
    end
    return "not registered"
  end

end
