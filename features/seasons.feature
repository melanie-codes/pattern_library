Feature: Seasons

  Scenario: List seasons
    Given the system knows about the following seasons:
      | name             |
      | Spring/Summer    |
      | Fall/Winter      |
    When the client requests a list of "/api/seasons"
    Then the response is a list containing two seasons
    And the client requests the first designer through "/api/season/1"
    Then the response should contain "Spring/Summer"

  Scenario: Create a season
    When I send the api the following season:
      | name            |
      | Spring/Summer   |
    Then the response should contain "Spring/Summer"

  Scenario: Update a season
    Given the system knows about the following season:
      | name          |
      | Spring/Summer |
    And I update the season's name with "Spring"
    Then the response should contain "Spring"

  Scenario: Destroy a season
    Given the system knows about the following season:
      | name          |
      | Fall/Winter   |
    And I destroy the season
    Then the response should be "season deleted"

  Scenario: Get patterns sorted by season
    Given the system knows about the following season:
      | name            |
      | Spring/Summer   |
    And the season knows the following patterns:
      | name                 | description                                         |
      | Candle Flame Lapghan | Made using Quince & Co. Osprey, 100% American wool  |
      | Forest Wreath        | It uses two different colors of the Maiden Hair yarn|
      | Bay Leaf             | Uses color 1037 Lettuce for the light color         |
    When I call for the seasons patterns
    Then the response should contain the three patterns
