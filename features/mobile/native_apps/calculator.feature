@android
Feature: Calculator
  As a Calculator user
  I would like to validate that the calculator can do basic arithmetic

  @calculator @addition
  Scenario: Native App Calculator - Addition of two integers
    Given   I am on the home page of the "Calculator" app
    And     I click on the Calculator "4" button
    And     I click on the Calculator "add" button
    And     I click on the Calculator "3" button
    And     I click on the Calculator "equal" button
    Then    I should have the answer to "3" plus "4"

  @calculator @subtraction
   Scenario: Native App Calculator - Subtraction of two integers
    Given   I am on the home page of the "Calculator" app
    And     I click on the Calculator "5" button
    And     I click on the Calculator "subtract" button
    And     I click on the Calculator "3" button
    And     I click on the Calculator "equal" button
    Then    I should have the answer to "5" minus "3"




