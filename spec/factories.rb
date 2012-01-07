FactoryGirl.define do

  factory :user do
    sequence(:first_name) {|n| "User ##{n}"}
    sequence(:email) {|n| "#{n}@sunni.ru"}
    user_type "user"
    password "pass"
    password_confirmation "pass"
  end

  factory :event do
    sequence (:event_name) { |n| "Event Name ##{n}" }
  end

  factory :registration do
    register_status "approved"
    association :user
    association :event
  end

end
