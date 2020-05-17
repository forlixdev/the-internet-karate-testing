Feature: dropdown

  Background:
    * def dropdown_list = "select[id=dropdown]"
    * def dropdown_selection_1 = "#dropdown > option:nth-child(2)"
    * def dropdown_selection_2 = "#dropdown > option:nth-child(3)"

  @ignore
  Scenario: click on the second checkbox with select() function
    Given driver host + '/dropdown'
    When select('select[id=dropdown]', 'Option 2')
    And delay(2000)
    Then match attribute(dropdown_selection_2, 'selected') == 'selected'

  Scenario: click on the second checkbox with click
    Given driver host + '/dropdown'
    When waitFor(dropdown_list).click()
    And input(dropdown_list,'Option 2')
    Then match attribute(dropdown_selection_2, 'selected') == 'selected'





