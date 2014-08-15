Feature: Economy Parking
  The parking lot calculator can calculate costs for Economy Parking.

  Scenario Outline: Calculate Economy Parking cost
    When I park my car in the Economy Parking lot for <parking duration>
    Then I will have to pay <parking costs>

  Examples:
    | parking duration | parking costs |
    | 30 minutes       | $ 2.00        |
    | 1 hour           | $ 2.00        |
    | 4 hours          | $ 8.00        |
    | 5 hours          | $ 9.00        |
    | 6 hours          | $ 9.00        |
    | 24 hours         | $ 9.00        |
    | 1 day, 1 hour    | $ 11.00       |
    | 1 day, 3 hours   | $ 15.00       |
    | 1 day, 5 hours   | $ 18.00       |
    | 6 days           | $ 54.00       |
    | 6 days, 1 hour   | $ 54.00       |
    | 7 days           | $ 54.00       |
    | 1 week, 2 days   | $ 72.00       |
    | 3 weeks          | $ 162.00      |