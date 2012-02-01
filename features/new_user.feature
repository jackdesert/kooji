Feature: Create and UPdate user

  Scenario:
    Given I go to the login page
    And I follow "Create an Account"
    And I fill in "* First Name" with "Joe"
    And I fill in "* Last Name" with "Schmoe"
    And I fill in "* Email" with "joe@schmoe.com"
    And I fill in "* Password" with "pass"
    And I fill in "* Confirm Password" with "pass"
    And I fill in "* Phone" with "(208) 366-4737"
    And I fill in "Experience" with "none"
    And I fill in "Exercise" with "I ride a bike"
    And I fill in "Medical" with "I take allergy pills"
    And I fill in "Emergency contact" with "Michele"
    And show me the page
    And I press "usersave"
    Then I should see "User was successfully created"