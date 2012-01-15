class Event < ActiveRecord::Base
  has_many :registrations
  has_many :users, :through => :registrations
  belongs_to :registrar, :class_name => "User"
  validates :end_date, :date => {:after_or_equal_to => :start_date,
            :message => "must be AFTER start date.", :allow_nil => true}

# This is how we say that a class belongs to itself
  belongs_to :program, :class_name => 'Event', :foreign_key => 'program_id'

  validates_format_of :event_status, :with => /^(open)?(closed)?(waitlist)?(canceled)?$/
  validates_presence_of :event_status, :description, :event_is_program, :event_name, :gear_list, :confirmation_page, :start_date


  def date_range
    return "no date entered" unless self.start_date
    unless self.end_date
      date = self.start_date.strftime("%A %b %e, %Y")
      return date.single_space
    end
    if self.start_date.year == self.end_date.year
      first = self.start_date.strftime("%A %b %e")
      last = self.end_date.strftime("%A %b %e, %Y")
      return first.single_space + " - " + last.single_space
    else
      first = self.start_date.strftime("%A %b %e, %Y")
      last = self.end_date.strftime("%A %b %e, %Y")
      return first.single_space + " - " + last.single_space
    end
  end

  def leaders
    management(:leader)
  end
  def coleaders
    management(:coleader)
  end
  def management(register_status)
    regs = Registration.where(:event_id => self.id, :register_status => register_status)
    managers = []
    regs.each do |reg|
      managers << reg.user
    end
    return managers
  end

  def management_hash
    hash = {}
    hash[:leaders] = {}
    hash[:coleaders] = {}
    hash[:registrar] = {}

  end

  def registered?(user)
    Registration.where(:event_id => self.id, :user_id => user.id).empty? ? false : true
  end
  

#  validates_presence_of :event_status, :event_is_program, :event_name, :pricing, :description, :confirmation_page, :start_date

end
