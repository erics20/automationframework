@iOS
Feature: UICatalog
  As a UICatalog test user
  I would like to click on objects and make the screen do stuff

  @uicatalog
  Scenario: Native App UICatalog - type into a search bar
    Given   I am on the home page of the "UICatalog" app
    And     I click on the UICatalog "Search Bars" button
    And     I click on the Search Bars "Default" button
    And     I click on the Default Search Bar "Scope One" text field
    Then    I should be able to type "Hello" into the search bar

#  @uicatalog
#  Scenario: Native App UICatalog - type into some text fields
#    Given   I am on the home page of the "UICatalog" app
#    And     I click on the UICatalog "Text Fields" button
#    And     I type "Hello" in the Text Fields "Default" text field
#    And     I type "Hello" in the Text Fields "Secure" text field
#    And     I type "Hello" in the Text Fields "Custom" text field
#    Then    I should see "Hello" in each text field
