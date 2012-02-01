FactoryGirl.define do

  factory :user do
    sequence(:first_name) {|n| "Jack"}
    last_name "B. Nimble"
    sequence(:email) {|n| "#{n}@sunni.ru"}
    user_type "participant"
    password "pass"
    password_confirmation "pass"
    diet "I can eat pretty much eat anything, but I especially have to get a lot of protein into my system in the early hours of the day to keep my energy levels up"
    medical "I'm allergic to bee stings, but I always carry a shot of adrenalin with me in case I get stung on the traiil"
    exercise "In the summertime, I ride my bike 15-20 miles a week and run once for an hour. In the winter, I do a couple 1/2 hour walks on the flat trails behind my house every week."
    experience "During 2011 I climbed Mt. Monadnock (January, with snowshoes on ), and climbed about seven 4,000 footers, some with full overnight packs."
    phone "2082081234"
    member true
    emergency_contact "My mother Ruth Fellhart, (617) 495-4494"
  end

  factory :event do
    sequence (:event_name) { |n| "Event Name ##{n}" }
    start_date 3.days.from_now.to_date
    event_status "open"
    event_is_program "n"
    rating "B3B"
    pricing "$150 includes two nights lodging, breakfasts Saturday and Sunday mornings, happy hour snacks friday evening, and dinner (with wine) Saturday."
    description "On this luxurious cruise through the White Mountains, you can enjoy all your favorite beverages (as long as you're willing to pack them) and 
    see all the best sights. We'll go sledding, caroling, ice skating, and build a bonfire. If we run out of fun things to do,
    we will NOT do like my mom always said and fold laundry--rather, we will hike to the neighboring campsite
    and ask to borrow two eggs to make peanut butter cookies with (just kidding, just for a laugh you know)."
    
    trip_info "Meet us at 1695 Southtower Rd in Morton, MA at 6:30pm on Friday."
    confirmation_page "Thank you for registering. We'll be in touch soon"
    question1 "Do you have any experience doing high altitude (above 12,000ft) climbs?"
    gear_list "For this event, you'll need some winter hiking gear. Mittens, ski mask, hot chocolate, and kindling are a must. Snow pants will definitely be in fashion, and bring an axe if you have one so we can stock up on our firewood supply."
    
    registrar_id 1
# This registrar association causes it to fail, so I took it out
    association :registrar, :factory => :user
  end

  factory :registration do |a|
    a.register_status "approved"
    a.association :user
    a.association :event
    a.carpooling "need ride"
    a.carpooling_blurb "I'm pretty quiet when I drive, but I listen to cool tunes"
    a.leaving_from "Westborough, MA"
    a.leave_time "Friday about 3pm"
    a.return_time "Whenever we finish up on Sunday"
    a.returning_to "Westborough, MA"
    a.gear_answer "I have most everything--I just need to borrow a -5 degree sleeping bag"
    a.answer1 "I'm totally new to this high altitude thing"
    a.has_questions "I want to bring my video camera on the event. Do you have any tips on keeping it dry?"
    a.user_notes "Lindsay said she might have room in her car for me. Her number is 207.277.4255"
    a.registrar_notes "He has all the right gear, he's just a little bit afraid of heights."
  end

end
