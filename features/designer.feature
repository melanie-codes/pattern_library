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
