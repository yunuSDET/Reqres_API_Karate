Feature:Single Resource Functionality

  Background: Url
    Given url "https://reqres.in/"


  Scenario Outline: Verify the name,year of users with following ids 1,2,3,4
    Given path "api/unknown"
    Given path id = "<id>"
    When method get
    Then status 200
    * assert response.data.name == "<name>"
    * assert response.data.year == "<year>"

    Examples:
      | id | name         | year |
      | 1  | cerulean     | 2000 |
      | 2  | fuchsia rose | 2001 |
      | 3  | true red     | 2002 |
      | 4  | aqua sky     | 2003 |


  Scenario: Verify that if the url of support is working
    Given path "api/unknown"
    Given path "2"
    When method get
    Then status 200
    * def supportUrl = response.support.url
    Given url supportUrl
    When method get
    Then status 200



  Scenario: Verify that single resource with invalid id gives the 404 statuscode and response is {}
    Given path "api/unknown"
    Given path "250"
    When method get
    Then status 404
    * match response == {}