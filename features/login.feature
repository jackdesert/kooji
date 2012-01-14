Feature: Use Can Log In

  Background: 
    Given the following user exists:
      | email      | password | password_confirmation |
      | hi@you.com | pass    | pass                  |
    And I go to the login page
    
  Scenario:
    When I fill in "Email Address" with "not_even_a_real_email_address"
    And I fill in "Password" with "pass"
    And I press "Sign In"
    Then I should see "does not look like a real email address"
    And I should see "not_even_a_real_email_address"
    
  Scenario:
    When I fill in "Email Address" with "not_in_system@hi.com"
    And I fill in "Password" with "pass"
    And I press "Sign In"
    Then I should see "was not found in our system"
    And I should see "not_in_system@hi.com"
    
  Scenario:
    When I fill in "Email Address" with "hi@you.com"
    And I fill in "Password" with "wrong_password"
    And I press "Sign In"
    Then I should see "is in our system. But you typed the wrong password"
    And I should see "hi@you.com"
    
    
  Scenario:
    When I fill in "Email Address" with "hi@you.com"
    And I fill in "Password" with ""
    And I press "Sign In"
    Then I should see "You must enter a password"
    
    