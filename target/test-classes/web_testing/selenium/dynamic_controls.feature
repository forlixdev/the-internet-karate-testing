Feature: dynamic controls

  Scenario: check that content changes after refresh
    * def check_box_selector = "#checkbox"
    * def remove_check_box_button_selector = "#checkbox-example > button"

    Given driver host + '/dynamic_controls'
    When waitForEnabled(check_box_selector).click()
    And waitForEnabled(remove_check_box_button_selector).click()
    Then match text("#message") == "It's gone!"
    And waitForResultCount(check_box_selector, 0)

  Scenario: Enable/disable
    * def textbox_selector = "#input-example > input[type=text]"
    * def button_selector = "#input-example > button"

    Given driver host + '/dynamic_controls'
    And match attribute(textbox_selector, 'disabled') != null
    When waitFor(button_selector).click()
    Then match waitFor("#message").text == "It's enabled!"
    And match attribute(textbox_selector, 'disabled') == null


