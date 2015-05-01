Feature: Turmites don't eat wood

  +------------------+-------------------------------------------------------------------+
  |                  |                          Current color                            |
  |                  |---------------------------------+---------------------------------+
  |                  |                 0               |                1                |
  |                  |-------------+------+------------+-------------+------+------------+
  |                  | Write color | Turn | Next state | Write color | Turn | Next state |
  +--------------+---+-------------+------+------------+-------------+------+------------+
  |              | 0 |      1      |  R   |      0     |      1      |   R  |      1     |
  |Current state +---+-------------+------+------------+-------------+------+------------+
  |              | 1 |      0      |  N   |      0     |      0      |   N  |      1     |
  +--------------+---+-------------+------+------------+-------------+------+------------+

  The direction to turn is one of L (90° left), R (90° right), N (no turn) and U (180° U-turn).

  Scenario: turmites exist on a 2D grid of squares
    Given a turmite is spawned
    Then it should be at location 0, 0
    And it should be heading North

  @wip
  Scenario Outline: turmites eating squares
    Given a turmite is spawned
    And my current state is <state>
    When I move to the next square which is <color>
    Then I should have turned 90° <direction> and end up facing <heading>
    And the square should change to <write_color>
    And my state should change to <next_state>

  Examples:
    | state | color | direction | heading | write_color | next_state |
    | 0     | 0     | right     | east    | 1           | 0          |
    | 0     | 1     | right     | east    | 1           | 1          |
