# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_1 = Factory(:user, :email => "demo@sunni.ru", :first_name => "Lindsay", :last_name => "Jones", :leadership_philosophy =>"I've been hiking these trails since I was knee-high to a grasshopper. It brings me such joy to take new people to the woods:)")
user_2 = Factory(:user, :first_name => "Charles", :last_name => "Boney", :leadership_philosophy => "I hike for the exercise, and I always meet new people along the trail.")
user_3 = Factory(:user, :first_name => "Pike", :last_name => "Judd")
user_4 = Factory(:user, :first_name => "Jackie", :last_name => "Marshall", :user_type => "staff")
user_5 = Factory(:user, :first_name => "Faith", :last_name => "Lundgren", :leader_request => true)
user_6 = Factory(:user, :first_name => "Heath", :last_name => "Frankfurt")
admin  = Factory(:user, :email => "admin@sunni.ru", :user_type => "admin")
if false #Rails.env == "development"
  [user_1, user_2, user_3, user_4, user_5, user_6].each do |u|
    file = Dir.glob('public/fish*.jpg').first
    file_obj = File.open(file)
    u.photo = file
    u.save
  end
end
event = Factory(:event, :registrar_id => user_1.id)

Factory(:registration, :user_id => user_1.id, :event_id => event.id, :register_status => "leader")
Factory(:registration, :user_id => user_2.id, :event_id => event.id, :register_status => "coleader")
Factory(:registration, :user_id => user_3.id, :event_id => event.id, :display_phone => true)
Factory(:registration, :user_id => user_4.id, :event_id => event.id, :display_phone => true)
Factory(:registration, :user_id => user_5.id, :event_id => event.id, :carpooling => "can take", :room_for => 3)
Factory(:registration, :user_id => user_6.id, :event_id => event.id, :carpooling => "all set")
