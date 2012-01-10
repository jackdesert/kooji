
Given /^I go to the login page$/ do
  page.visit new_user_session_path
end

Given /^I go to the "([^"]*)" event page$/ do |arg1|

  event = Event.where(:event_name => arg1).first
  path = event_path(event.id)
  visit path
end