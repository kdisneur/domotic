Feature: lamps

  Scenario: list lamps
    Given I am on the lamps page
    Then I should see a list of lamp
    But I shouldn't see more than 10 lamps
