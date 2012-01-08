FactoryGirl.define do

  factory :user do
    sequence(:first_name) {|n| "User ##{n}"}
    last_name "Last"
    sequence(:email) {|n| "#{n}@sunni.ru"}
    user_type "user"
    password "pass"
    password_confirmation "pass"
  end

  factory :event do
    sequence (:event_name) { |n| "Event Name ##{n}" }
    start_date 3.days.from_now.to_date
# This registrar association causes it to fail, so I took it out
#    association :registrar, :factory => :user
  end

  factory :registration do |a|
    a.register_status "approved"
    a.association :user
    a.association :event
  end

end
