@browserstack
Feature: Cross Platform Testing
  As a cross platform tester
  I would like to validate that chrome on Windows runs my website as expected

  @windows
  Scenario: Google.ca on Windows
    Given   I am on "https://www.google.ca"
    And     I search for "cats"
    Then    I should see "cats"