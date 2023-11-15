Feature:Delay functionality


  Background:
    Given url "https://reqres.in/"


  Scenario: Delay response for 2 seconds and verify that response time is bigger then delay time
    * def delaySecond = 2
    Given path "api/users"
    Given param delay = delaySecond
    When method get
    Then status 200
    * assert responseTime > delaySecond * 1000


  Scenario Outline: Delay response for 2,3,4,5 seconds for each time and verify that response times are bigger then delay times
    * def delaySecond = "<delayTime>"
    Given path "api/users"
    Given param delay = delaySecond
    When method get
    Then status 200
    * assert responseTime > "<delayTime>" * 1000

    Examples:
      | delayTime |
      | 2         |
      | 3         |
      | 4         |
      | 5         |



