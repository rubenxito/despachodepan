Feature: Manage cards
  In order to present our projects
  As an admin
  In want to create and manage cards
  
  Scenario: Card list
    Given I am logged in
    When I go to the list of cards
    Then I should see :cards.index.title


