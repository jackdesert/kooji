class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  # this is a composite uniqueness constraint
  validates_uniqueness_of :user_id, :scope => :event_id
  validates_format_of :register_status, :with => /^(leader)?(coleader)?(approved)?(pending payment)?(waitlist)?(submitted)?(canceled)?$/
  validates_presence_of :register_status
  validates_presence_of :carpooling
  validates_format_of :carpooling, :with => /^(all set)?(can take)?(need ride)?$/, :message => "Options are all set, need ride, or can take"
  # drop off date is used to decide whether to show this event as a "future" or "past" event


  def sorted_by_status_and_date
    sort = math_status.to_f
    # Add a tiny portion of timestamped (not to exceed one)
    sort += self.updated_at.to_f/1e12
    return sort
  end
  
  def math_status
    case self.register_status
    when "leader"
      sort = 10
    when "coleader"
      sort = 9
    when "approved"
      sort = 7
    when "payment pending"
      sort = 6
    when "waitlist"
      sort = 5
    when "submitted"
      sort = 4
    when "canceled"
      sort = 3
    else
      sort = 0
      flash[:error] = "Register status not found"
    end  
    if self.event.registrar == self.user && sort < 8
      sort = 8
    end
    sort
  end
      
  def self.return_approved_users(registrations)
    approved_registrations = return_approved_registrations(registrations)
    approved_users = []
    approved_registrations.each do |reg|
      approved_users << reg.user
    end
    approved_users
  end
  
  
  def self.return_approved_registrations(registrations)
    approved_registrations = []
    registrations.each do |reg|
      approved_registrations << reg if ["approved", "leader", "coleader"].include? reg.register_status
    end
    approved_registrations
  end
  
  def compound_from
    leaving_from = self.leaving_from
    leave_time = self.leave_time
    leaving_from + " @ " + leave_time
  end
  
  def compound_to
    returning_to = self.returning_to
    return_time = self.return_time
    returning_to + " @ " + return_time
  end
  
  def display_phone_if_selected
    return nil if self.user.phone.nil?
    return nil unless self.display_phone
    self.user.phone.pretty_phone
  end
  
  def pretty_carpooling
    return nil if self.carpooling.blank?
    case self.carpooling
    when "can take"
      return "Room for #{self.room_for}" if self.room_for
      return "Room for ?"
    when "need ride"
      return "Needs Ride"
    when "all set"
      return "All Set"
    end
    return "?"
  end
end
