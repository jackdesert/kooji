Feature: Root URL loads my events

  Background:
    Given the following user exists:
      | first_name | last_name | email   |
      | Jack       | Daniels   | 2@2.com |
    Given the following events exist:
      | event_name | start_date | end_date   |
      | FunHike    | 2011-12-12 | 2011-12-24 |
      | LakeJump   | 2011-13-13 |            |
      | FindNemo   | 2012-02-25 |            |

    And the following registrations exist:
      | user                |
      | first_name: Jack    |

    And "2@2.com" has the password "foo"
    And I sign in via the login page with "2@2.com/foo"

  Scenario:
    I should see "My Current Events"
