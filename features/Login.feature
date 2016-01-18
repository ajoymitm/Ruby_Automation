Feature: As an operator
  I want to login to Automation practice applications
  So that can access all its application features

# This Scenario verifies that user can do one complete end to end shopping
  Scenario: Verify that user can login into Automation Practice site with valid credentials
    Given I am on Login Page
    And I provide valid credentials
    And I click on Login button
    Then I should get logged in