################################################################
#####  R E S T A R T    S E R V E R    After changing this file

# Load the rails application
require File.expand_path('../application', __FILE__)


ActionMailer::Base.smtp_settings = {
  :user_name => "hbboston",
  :password => "amcregi",
  :domain => "hbbostonamc.org",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

# Initialize the rails application
Regi::Application.initialize!
