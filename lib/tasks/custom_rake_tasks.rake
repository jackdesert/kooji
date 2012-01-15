namespace :db do
  task :remigrate => [:drop, :create, :migrate, :seed] do
    puts "Done Dropping, Creating, Migrating, and Seeding"
  end
  
  task :delete_records => :environment do
    puts "Deleting database records"
    User.delete_all
    Registration.delete_all
    Event.delete_all
  end
end