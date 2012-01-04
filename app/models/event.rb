class Event < ActiveRecord::Base
  has_many :registrations
  has_many :users, :through => :registrations
  belongs_to :registrar, :class_name => "User"
#  validates_presence_of :event_status, :event_is_program, :event_name, :pricing, :description, :confirmation_page, :start_date
end
