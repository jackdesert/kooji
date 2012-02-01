Feature: User can sign up for an event
  Scenario: 
    Given the following event exists:
      | event_name |
      | Wine Fest  |
    Given the following user exists:
      | email      |
      | a@sunni.ru |
    Given I go to the sign up page for "Wine Fest"
    Then I should see "Wine Fest"
    When I press "Sign Up For This Event"
    And I fill in ""
    