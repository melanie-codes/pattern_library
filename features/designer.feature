Feature: Designers

  Scenario: List designers
    Given the system knows about the following designers:
      | name          | brand     |
      | Stephen West  | Westknits |
      | Andrea Mowry  | DreaRenee |
    When the client requests a list of "/api/designers"
    Then the response is a list containing two designers
    And the client requests the first designer
    Then the response should contain "Stephen West"

  Scenario: Create a designer
    When I send the api the following designer:
      | name            | brand    |
      | Linnea Ornstein | linnah   |
    Then the response should contain "Linnea Ornstein"

  Scenario: Update a designer
    Given the system knows about the following designer:
      | name          | brand     |
      | Stephen West  | Westknits |
    And I update the designer's name with "Malia Mather"
    Then the response should contain "Malia Mather"

  Scenario: Destroy a designer
    Given the system knows about the following designer:
      | name          | brand     |
      | Stephen West  | Westknits |
    And I destroy the designer
    Then the response should be "designer deleted"

  Scenario: Get a designers' patterns
    Given the system knows about the following designer:
      | name            | brand     |
      | Nancy Marchant  | briocher  |
    And the designer has the following patterns:
      | name                 | description                                         |
      | Candle Flame Lapghan | Made using Quince & Co. Osprey, 100% American wool  |
      | Forest Wreath        | It uses two different colors of the Maiden Hair yarn|
      | Bay Leaf             | Uses color 1037 Lettuce for the light color         |
    When I call for the designer's patterns
    Then the response should contain the three patterns
