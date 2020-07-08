Feature: Google search
##
  Scenario Outline: navigate and search and check google
    Given opened google search page
    And search string is selected
    When <keyWords> are entered
    And submitted
    Then title should contain <keyWords>

    Examples:
    |keyWords|
    | I2C Wiki |
    | ARM Wiki |
    |Oscillator|
