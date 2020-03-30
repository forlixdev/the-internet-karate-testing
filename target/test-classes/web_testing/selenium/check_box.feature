Feature: check box

  Background:
    * def checkBox1 = "#checkboxes > input[type=checkbox]:nth-child(1)"
    * def checkBox2 = "#checkboxes > input[type=checkbox]:nth-child(3)"

  # checkbox is checked
  Scenario: click on the first checkbox
    Given driver host + '/checkboxes'
    When waitForEnabled(checkBox1).click()
    Then match attribute(checkBox1, 'checked') != null

  Scenario: click on both checkboxes
    Given driver host + '/checkboxes'
    When waitForEnabled(checkBox1).click()
    And waitForEnabled(checkBox2).click()
    Then match attribute(checkBox1, 'checked') != null
    And match attribute(checkBox2, 'checked') == null









