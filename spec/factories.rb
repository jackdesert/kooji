FactoryGirl.define do

  factory :user do
    sequence(:first_name) {|n| "Jack"}
    last_name "B. Nimble"
    sequence(:email) {|n| "#{n}@sunni.ru"}
    user_type "user"
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
    description "Do your layouts deserve better than Lorem Ipsum? Apply as an art director and team up with the best copywriters at Jung von Matt: www.jvm.com/jobs/lipsum

    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dignissim dictum leo, sit amet viverra nisi porttitor quis. Ut et nibh sit amet massa lobortis imperdiet. Nunc sed mollis ante. Curabitur a nulla est, ac congue ante. Nam lobortis, magna ut ultrices hendrerit, nibh augue sagittis purus, ac condimentum tortor metus vel quam. Etiam sollicitudin facilisis dolor. Donec sodales tincidunt elementum.

    Vestibulum lorem nibh, ornare lobortis molestie et, tincidunt quis lorem. Donec lobortis aliquet nisl, vitae venenatis sapien vehicula vel. Vestibulum sit amet urna consectetur dolor scelerisque luctus. Phasellus id felis leo, nec auctor orci. Maecenas in quam diam, sit amet accumsan dolor. Duis urna erat, accumsan sit amet pulvinar nec, eleifend vel sapien. Sed libero arcu, fringilla id faucibus eget, vehicula quis magna. Vivamus congue metus sed mi convallis in sodales purus laoreet. Nam in neque ut diam tincidunt pharetra. Ut tortor leo, bibendum sit amet mattis eget, suscipit vel eros. Nunc luctus diam vel tortor gravida a posuere augue facilisis. Praesent sed nunc a dolor tincidunt condimentum.

    Ut fringilla eros eleifend quam pellentesque sit amet porttitor nibh dapibus. Nunc nec augue quis lorem tristique viverra sit amet eget purus. Vestibulum leo urna, aliquet sit amet rutrum vitae, laoreet quis purus. Aliquam quam eros, posuere in viverra quis, suscipit nec metus. Aenean cursus accumsan dolor, quis dapibus erat pretium eget. Cras nec tortor fermentum turpis pulvinar consequat ac vel lacus. Curabitur vulputate dui ac ante porta ullamcorper. Etiam vestibulum tellus mi, sit amet consectetur nunc. Nulla eu nulla tortor, a cursus tellus. Morbi tincidunt, ligula vitae euismod sollicitudin, dui magna rhoncus est, vel tincidunt eros urna ut justo. Phasellus est nunc, malesuada in euismod ac, eleifend at risus. Morbi ut mauris sed nunc tempor euismod in non felis. Suspendisse viverra elit sed risus tempor blandit."
    trip_info "Meet us at 1695 Southtower Rd in Morton, MA at 6:30pm on Friday."
    confirmation_page "Thank you for registering. We'll be in touch soon"
    question1 "Do you have any experience doing high altitude (above 12,000ft) climbs?"
    gear_list "For this event, you'll need some winter hiking gear Do your layouts deserve better than Lorem Ipsum? Apply as an art director and team up with the best copywriters at Jung von Matt: www.jvm.com/jobs/lipsum

    Ut fringilla eros eleifend quam pellentesque sit amet porttitor nibh dapibus. Nunc nec augue quis lorem tristique viverra sit amet eget purus. Vestibulum leo urna, aliquet sit amet rutrum vitae, laoreet quis purus. Aliquam quam eros, posuere in viverra quis, suscipit nec metus. Aenean cursus accumsan dolor, quis dapibus erat pretium eget. Cras nec tortor fermentum turpis pulvinar consequat ac vel lacus. Curabitur vulputate dui ac ante porta ullamcorper. Etiam vestibulum tellus mi, sit amet consectetur nunc. Nulla eu nulla tortor, a cursus tellus. Morbi tincidunt, ligula vitae euismod sollicitudin, dui magna rhoncus est, vel tincidunt eros urna ut justo. Phasellus est nunc, malesuada in euismod ac, eleifend at risus. Morbi ut mauris sed nunc tempor euismod in non felis. Suspendisse viverra elit sed risus tempor blandit."
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
