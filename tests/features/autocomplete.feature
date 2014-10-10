Feature: Autocomplete
  Scenario: Using Control-N
    Given I'm editing a file named "afile.go" with contents
    """
    package main

    import "fmt"

    func main() {
    }
    """
    And I hit "GO"
    When I am inserting the text "fmt.Printl"
    And I wait a second
    And I hit "<c-n>"
    Then the contents of the current line should be "fmt.Println("

  Scenario: Using Tab
    Given I'm editing a file named "afile.rb" with contents
    """
    class Fixture
      def mymethod
      end
    end
    """
    And I hit "Go"
    When I am inserting the text "Fix"
    And I wait a second
    And I hit "<tab>"
    Then the contents of the current line should be "Fixture"

  Scenario: Using arrow keys and completing with .
    Given I'm editing a file named "afile.c"
    When I am inserting the text "#include <stdio"
    And I wait a second
    And I hit "<down>>"
    Then the contents of the current line should be "#include <stdio.h>"
