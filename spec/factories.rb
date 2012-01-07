FactoryGirl.define do

  factory :user do
    sequence(:first_name) {|n| "User ##{n}"}
    sequence(:email) {|n| "#{n}@sunni.ru"}
    user_type "user"
    password "pass"
    password_confirmation "pass"
  end


end
