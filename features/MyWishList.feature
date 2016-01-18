Feature: As an operator
  I want to do shopping
  So that I can purchase some item



  Background:
    Given I am on Login Page
    And I provide valid credentials
    And I click on Login button
    Then I should get logged in

# This Scenario verifies that user can shop
  Scenario: Verify that user can shop
    Given I click on MY WishList
    And I Enter the name
    And I click on Save Button


