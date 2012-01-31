Feature: User can approve participants and set leaders and coleaders

  Background:
    Given the following user exists:
      | first_name | last_name | email          | user_type |
      | Jack       | Daniels   | jack@sunni.ru  | admin     |
      | Slow       | Paddler   | paddle@sunni.ru | participant      |
      | Paid       | InFull    | paid@sunni.ru  | participant      |
      | Lowly      | Shepherd  | shep@sunni.ru  | participant      |
    Given the following events exist:
      | event_name      | start_date | end_date   | registrar         |
      | FunHike         | 2011-12-12 | 2011-12-24 | first_name: Lowly |
      | PreviousHike    | 2011-12-12 | 2011-12-24 | first_name: Lowly |
    Given the following registrations exist:
     | event                    | user              | register_status |
     | event_name: FunHike      | first_name: Paid  | approved        |
     | event_name: FunHike      | first_name: Slow  | pending payment |
     | event_name: FunHike      | first_name: Jack  | submitted       |
     | event_name: PreviousHike | first_name: Jack  | approved        |


  Scenario: User is redirected to to event after login 
    And I go to the "FunHike" event page
    Then I should see "Please log in"
    And I fill in "Email Address" with "paid@sunni.ru"
    And I fill in "Password" with "pass"
    And I press "Sign In"
    Then I should see "FunHike"
    
  Scenario: User is redirected to to event roster after login 
    And I go to the "FunHike" event roster page
    Then I should see "Please log in"
    And I fill in "Email Address" with "paid@sunni.ru"
    And I fill in "Password" with "pass"
    And I press "Sign In"
    Then I should see "Recent Events"
    
  Scenario: Pending Payment users can not see the carpooling list
    And I go to the "FunHike" event carpooling page
    Then I should see "Please log in"
    And I fill in "Email Address" with "paddle@sunni.ru"
    And I fill in "Password" with "pass"
    And I press "Sign In"
    Then show me the page
    Then I should see "Only approved participants can view the carpooling page"

    
  Scenario: Approved users can see the carpooling list, but cannot see carpooling of un-approved users
    And I go to the "FunHike" event carpooling page
    Then I should see "Please log in"
    And I fill in "Email Address" with "paid@sunni.ru"
    And I fill in "Password" with "pass"
    And I press "Sign In"
    Then I should see "This is where you can see who else is going on this trip"
    And I should see "Paid InFull"
    And I should not see "Slow Paddler"
    
  Scenario: Roster page shows previous events--but not the current one--and only events where user was approved, leader, or coleader
    And I go to the "FunHike" event roster page
    When I fill in "Email Address" with "jack@sunni.ru"
    And I fill in "Password" with "pass"
    And I press "Sign In"
    And I go to the "FunHike" event roster page
And show me the page
    Then I should see in this order:
        | Recent Events |
        | PreviousHike   |
    And I should not see in this order:
        | Recent Events |
        | FunHike        |
    