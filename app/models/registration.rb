class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  # this is a composite uniqueness constraint
  validates_uniqueness_of :user_id, :scope => :event_id

  # drop off date is used to decide whether to show this event as a "future" or "past" event
  def future?
    if self.event.end_date
      master_date = self.event.end_date
    else
      master_date = self.event.start_date
    end
    master_date >= Time.now.to_date
  end
end
