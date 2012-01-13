FactoryGirl.define do

  factory :user do
    sequence(:first_name) {|n| "User ##{n}"}
    last_name "Last"
    sequence(:email) {|n| "#{n}@sunni.ru"}
    user_type "user"
    password "pass"
    password_confirmation "pass"
    diet "Whole Foods"
    medical "Allergic to Pennicillin"
    exercise "jump rope"
    experience "Mt. Everest"
    phone "2082081234"
    member true
    emergency_contact "My mother Ruth, (208) 495-4494"
  end

  factory :event do
    sequence (:event_name) { |n| "Event Name ##{n}" }
    start_date 3.days.from_now.to_date
    event_status "open"
    event_is_program "n"
    rating "B3B"
    pricing "Free to children under 60"
    description "Climb to the top of the second tallest mountain in the world"
    trip_info "Meet at 6:30 am by Dunklee's Pizza"
    confirmation_page "we'll be in touch soon"
    question1 "What color is your parachute?"
    gear_list "Matches and a lighter"
    registrar_id 1
# This registrar association causes it to fail, so I took it out
#    association :registrar, :factory => :user
  end

  factory :registration do |a|
    a.register_status "approved"
    a.association :user
    a.association :event
    a.carpooling "need ride"
    a.leaving_from "Lincoln"
    a.leave_time 2.months.from_now
    a.return_time 3.months.from_now
    a.returning_to "Brookline"
    a.gear_anwer "I need to borrow a sleeping bag"
    a.answer1 "Time is never enough"
    a.has_questions "Do I need to bring deodorant?"
    a.user_notes "My private notes"
    a.registrar_notes "this person has all the right gear, but is afraid of heights"

end

end
