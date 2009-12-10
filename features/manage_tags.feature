Feature: Manage tags
  In order to have my cards ordered
  As an admin
  In want to create and manage tags

  @focus
  Scenario: Tag list
    Given I am logged in
    And a color exists with name: "Color"
    And a tag exists with name: "Testing", color_id: "1"
    When I go to the list of tags
    Then I should see :tags.index.title
    And I should see "Testing"

  Scenario: From index to edit
    Given I am logged in
    And a tag exists with name: "Testing", color: "1"
    When I go to the list of tags
    And I follow :modify
    Then I should see "Modificar la categoría 'Testing'"

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





