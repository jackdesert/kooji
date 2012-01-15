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

task :reset_heroku do
  puts 'pushing to repositories'
  puts `git push origin master`
  puts 'pushing to heroku'
  `git push heroku master`
  puts 'resetting the database'
  `heroku pg:reset SHARED_DATABASE --confirm evening-mountain-9380`
  puts 'migrating the database'
  `heroku run rake db:remigrate`
end