Feature: Patterns

  Scenario: List patterns
    Given the system knows about the following patterns:
      | name                 | description                                         |
      | Candle Flame Lapghan | Made using Quince & Co. Osprey, 100% American wool  |
      | Forest Wreath        | It uses two different colors of the Maiden Hair yarn|
      | Bay Leaf             | Uses color 1037 Lettuce for the light color         |
    When the client requests a list of "/api/patterns"
    Then the response is a list containing three patterns
    And the client requests the first pattern
    Then the response should contain "Candle Flame Lapghan"

  Scenario: Create a pattern
    When I send the api the following pattern:
      | name                 | description                                         |
      | Candle Flame Lapghan | Made using Quince & Co. Osprey, 100% American wool  |
    Then the response should contain "Candle Flame Lapghan"

  Scenario: Update a pattern
    Given the system knows about the following patterns:
      | name                 | description                                         |
      | Candle Flame Lapghan | Made using Quince & Co. Osprey, 100% American wool  |
    And I update the patterns's name with "Fire Lapghan"
    Then the response should contain "Fire Lapghan"

  Scenario: Destroy a pattern
    Given the system knows about the following patterns:
      | name                 | description                                         |
      | Candle Flame Lapghan | Made using Quince & Co. Osprey, 100% American wool  |
    And I destroy the pattern
    Then the response should be "pattern deleted"
