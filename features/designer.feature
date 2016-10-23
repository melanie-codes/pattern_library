Feature: Designers

  Scenario: List designers
    Given the system knows about the following designers:
      | name          | brand     |
      | Stephen West  | Westknits |
      | Andrea Mowry  | DreaRenee |
    When the client requests a list of "/designers"
    Then the response is a list containing two designers
