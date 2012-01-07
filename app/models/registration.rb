class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  # this is a composite uniqueness constraint
  validates_uniqueness_of :user_id, :scope => :event_id

  # drop off date is used to decide whether to show this event as a "future" or "past" event
  def drop_off_date
    if self.event.end_date
      return self.event.end_date
    else
      return self.event.start_date
    end
  end
end
