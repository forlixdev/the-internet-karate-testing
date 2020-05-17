Feature: dynamic content

  Background:
    * def dynamic_title = "#content > div > h3"

  Scenario: check that content changes dynamically after refresh
    Given driver host + '/dynamic_content'
    And match text(dynamic_title) == 'Dynamic Content'
    * def first_paragraph_content_before = text(first_paragraph)
    * print first_paragraph_content
    When refresh()
    And match text(dynamic_title) == 'Dynamic Content'
    And match text(first_paragraph) != first_paragraph_content_before




