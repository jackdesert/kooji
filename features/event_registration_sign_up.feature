Feature: User can sign up for an event
  Scenario: 
    Given the following event exists:
      | event_name |
      | Wine Fest  |
    Given the following user exists:
      | email      |
      | a@sunni.ru |
    When I go to the login page
    And I fill in "Email Address" with "a@sunni.ru"
    And I fill in "Password" with "pass"
    And I press "Sign In"
    And I go to the "Wine Fest" event page
    Then I should see "Wine Fest"
    And I press "Sign Me Up!"
    And I fill in "Gear answer" with "yes"
    And I fill in "Has questions" with "no"
    And I fill in "Answer1" with "Lots"
    And I choose "registration_carpooling_all_set"
    And I press "Sign Me Up!"
    Then I should see "Submitted"
    