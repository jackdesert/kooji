class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  # this is a composite uniqueness constraint
  validates_uniqueness_of :user_id, :scope => :event_id
  validates_format_of :register_status, :with => /^(leader)?(coleader)?(approved)?(waitlist)?(submitted)?(canceled)?$/
  validates_presence_of :register_status
  validates_presence_of :carpooling
  # drop off date is used to decide whether to show this event as a "future" or "past" event
  def future?
    if self.event.end_date
      master_date = self.event.end_date
    else
      master_date = self.event.start_date
    end
    master_date >= Time.now.to_date
  end

  def sorted
    sort = 6.0
    case self.register_status
    when "leader"
      sort = 0.0
    when "coleader"
      sort = 0.0
    when "approved"
      sort = 2.0
    when "waitlist"
      sort = 3.0
    when "submitted"
      sort = 4.0
    when "canceled"
      sort = 5.0
    end
    if self.event.registrar == self.user && sort > 0
      sort = 1.0
    end
    # Add a tiny portion of timestamped (not to exceed one)
    sort += self.updated_at.to_f/1e12
    return sort
  end

end
