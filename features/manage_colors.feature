Feature: Manage colors
  In order to give a nice touch to our cards
  As an admin
  In want to create and manage colors
  
  Scenario: Color list
    Given I am logged in
    And a color exists with name: "Pistacho", value: "AAAAAA", high_value: "FFFFFF"
    When I go to the list of colors
    Then I should see :colors.index.title
    And I should see "Pistacho"
    And I should see "AAAAAA"
    And I should see "FFFFFF"

  Scenario: From index to edit
    Given I am logged in
    And a color exists with name: "Pistacho", value: "AAAAAA", high_value: "FFFFFF"
    When I go to the list of colors
    And I follow :colors.index.modify
    Then I should see "Modificar el color 'Pistacho'"

  Scenario: Delete color
    Given I am logged in
    And a color exists with name: "Pistacho", value: "AAAAAA", high_value: "FFFFFF"
    When I go to the list of colors
    And I follow :colors.index.delete
    Then I should see :colors:index:title
    Then I should not see "Pistacho"

  Scenario: Add color
    Given I am logged in
    When I go to the list of colors
    When I fill in "Pistacho" for "color[name]"
    And I fill in "AAA" for "color[value]"
    And I fill in "FFF" for "color[high_value]"
    And I press :create
    Then I should be on the list of colors
    And I should see "Pistacho"





