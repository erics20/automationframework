@android
Feature: Calculator
  As a Calculator user
  I would like to validate that the calculator can do basic arthrimatic

  @calculator @addition
  Scenario: Native App Calculator - Addition of two integers
    Given   I am on the Calculator app
    And     I click on the "4" button
    And     I click on the "add" button
    And     I click on the "3" button
    And     I click on the "equal" button
    Then    I should have the answer to "3" plus "4"



