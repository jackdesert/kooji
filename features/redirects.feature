Feature: User can click an email link, log in, and be redirected to the appropriate path after logging in

  Background:
    Given the following user exists:
      | first_name | last_name | email   |
      | Jack       | Daniels   | jack@sunni.ru |
    Given the following events exist:
      | event_name | start_date | end_date   |
      | FunHike    | 2011-12-12 | 2011-12-24 |


  Scenario: User is redirected to to event after login 
    And I go to the "FunHike" event page
    Then I should see "Please log in"
    And I fill in "Email Address" with "jack@sunni.ru"
    And I fill in "Password" with "pass"
    And I press "Sign In"
    Then I should see "FunHike"