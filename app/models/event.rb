class Event < ActiveRecord::Base
  validates_presence_of :event_status, :event_is_program, :event_name, :pricing, :description, :confirmation_page, :start_date
end
