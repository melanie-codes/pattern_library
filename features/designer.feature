Feature: Designers

  Scenario: List designers
    Given the system knows about the following designers:
      | name          | brand     |
      | Stephen West  | Westknits |
      | Andrea Mowry  | DreaRenee |
    When the client requests a list of "/api/designers"
    Then the response is a list containing two designers
    And the client requests the first designer through "/api/designer/1"
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
