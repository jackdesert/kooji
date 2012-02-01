Feature: User can sign up for events

  Background:
    Given the following user exists:
      | first_name | last_name | email              |
      | Hannah     | Montana   | hannah@montana.org |
    Given the following event exists:
      | event_name   |
      | Fire Walking |
    When I go to the login page
    And I fill in "Email Address" with "hannah@montana.org"
    And I fill in "Password" with "pass"
    And I press "Sign In"

    Then I should see "You haven't signed up for any events yet."
  Scenario:
    When I go to the "Fire Walking" event page
    And I press "Sign Me Up!"
    Then I should see "Do you have any questions or comments for us?"
