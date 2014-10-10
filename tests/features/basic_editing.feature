Feature: Basic editing

  Scenario: Saving files with enter
    Given I'm editing a file named "afile.rb"
    When I insert the text "my content"
    And I hit "<cr>"
    Then the file "afile.rb" should contain "my content"

