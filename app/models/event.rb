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
    first = self.start_date.strftime("%A %b %e")
    last = self.end_date.strftime("%A %b %e, %Y")
    first.single_space + " - " + last.single_space
  end


#  validates_presence_of :event_status, :event_is_program, :event_name, :pricing, :description, :confirmation_page, :start_date

end
