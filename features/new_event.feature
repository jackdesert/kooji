Feature: User can approve participants and set leaders and coleaders

  Background:
    Given the following user exists:
      | first_name | last_name | email          | user_type |
      | Jack       | Daniels   | jack@sunni.ru  | admin     |




  Scenario: User is redirected to to event after login 
    And I go to the login page
    Then I should see "Please log in"
    And I fill in "Email Address" with "jack@sunni.ru"
    And I fill in "Password" with "pass"
    And I press "Sign In"
    Then I should see "You haven't signed up"
    When I follow "Create New Event"
    Then I should see "Event Name"