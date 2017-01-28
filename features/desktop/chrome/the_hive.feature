@chrome_desktop
Feature: Desktop Browser Automation
  As a Desktop Browser user
  I would like to click on objects, and do some cool stuff

  @chrome_desktop
  Scenario: Desktop automation - Sign up a new user and get to a market
    Given   I am on home page of the "The Hive"
    And     I click on the "Sign up" page
    And     I sign up a user
    And     I confirm their email using mailinator
    And     I choose a market
    Then    I should see a market page has loaded
