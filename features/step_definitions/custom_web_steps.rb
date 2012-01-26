Then /^shoot "([^"]*)"$/ do |filename|
  # Puts screenshots in /tmp/screenshots
  # These snippets were lifted out of the capybara-screenshot gem
  unless filename.empty?
    file_base_name = filename.strip.downcase.collude
  else
    file_base_name = "#{Time.now.strftime('%Y-%m-%d-%H-%M-%S')}"
  end
  screenshot_path = Rails.root.join "/tmp/screenshots"
  Dir.mkdir(screenshot_path) unless Dir.exists? screenshot_path
  file_name = "#{screenshot_path}/#{file_base_name}.png"
  if Capybara.current_driver == :selenium
    Capybara.page.driver.browser.save_screenshot(file_name)
  else
    puts "To save a screenshot, put '@javascript' before this scenario"
  end
end

Given /^I go to the "([^"]*)" event roster page$/ do |event_name|
  event = Event.find_by_event_name(event_name)
  visit roster_path(event)
end

Given /^I go to the "([^"]*)" event carpooling page$/ do |event_name|
  event = Event.find_by_event_name(event_name)
  visit carpooling_path(event)
end