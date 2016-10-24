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
