Feature: User can approve participants and set leaders and coleaders

  Background:
    Given the following user exists:
      | first_name | last_name | email         | user_type |
      | Jack       | Daniels   | jack@sunni.ru | admin     |
    Given the following events exist:
      | event_name | start_date | end_date   |
      | FunHike    | 2011-12-12 | 2011-12-24 |
    Given the following registrations exist:
     | event               |
     | event_name: FunHike |
     | event_name: FunHike |
     | event_name: FunHike |


  Scenario: User is redirected to to event after login 
    And I go to the "FunHike" event page
    Then I should see "Please log in"
    And I fill in "Email Address" with "jack@sunni.ru"
    And I fill in "Password" with "pass"
    And I press "Sign In"
    And show me the page
    Then I should see "FunHike"
    And show me the page
    
  Scenario: User is redirected to to event roster after login 
    And I go to the "FunHike" event roster page
    Then I should see "Please log in"
    And I fill in "Email Address" with "jack@sunni.ru"
    And I fill in "Password" with "pass"
    And I press "Sign In"
    Then I should see "Roster"
    And show me the page