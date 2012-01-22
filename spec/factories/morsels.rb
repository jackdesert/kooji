# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :morsel do
    user_id 1
    event_id 1
    text "MyText"
  end
end
