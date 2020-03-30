Feature: add remove elements

  Background:
    * def addButton = "#content > div > button"
    * def deleteButton = "#elements > button"

  # tips: checking if an element is non present: Not sure
  Scenario: click to add an element and then remove it
    Given driver host + '/add_remove_elements/'
    And match exists(deleteButton).exist == null
    And delay(1000)
    When click(addButton)
    Then match driver.text(deleteButton) == "Delete"
    When click(deleteButton)
    Then match exists(deleteButton).exist == null

    # tips: waitForResultCount() wait for all the elements to be selected
  Scenario: click to add two elements
    Given driver host + '/add_remove_elements/'
    And match exists(deleteButton).exist == null
    And delay(1000)
    When click(addButton)
    And click(addButton)
    Then waitForResultCount(deleteButton,2)





