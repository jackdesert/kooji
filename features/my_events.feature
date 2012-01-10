Feature: Root URL loads my events

  Background:
    Given the following user exists:
      | first_name | last_name | email   |
      | Jack       | Daniels   | jack@sunni.ru |
    Given the following events exist:
      | event_name | start_date | end_date   |
      | FunHike    | 2011-12-12 | 2011-12-24 |
      | LakeJump   | 2011-13-13 |            |
      | FindNemo   | 2012-02-25 |            |

    And the following registrations exist:
      | user                |
      | first_name: Jack    |

    And I go to the login page
    And I fill in "Email Address" with "jack@sunni.ru"
    And I fill in "Password" with "pass"
    And I press "Sign In"


  Scenario:
    Then I should see "My Current Events"

  Scenario: A new person signs up
      When I go to event "FunHike"
      And I press "Sign Up"
      Then "jack@sunni.ru" should receive an email   # Specify who should receive the email
