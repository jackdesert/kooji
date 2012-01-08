class Event < ActiveRecord::Base
  has_many :registrations
  has_many :users, :through => :registrations
  belongs_to :registrar, :class_name => "User"
  validates :end_date, :date => {:after_or_equal_to => :start_date,
            :message => "must be AFTER start date.", :allow_nil => true}

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


#  validates_presence_of :event_status, :event_is_program, :event_name, :pricing, :description, :confirmation_page, :start_date

end
