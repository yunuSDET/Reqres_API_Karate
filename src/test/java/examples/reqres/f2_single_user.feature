Feature: Single user Functionality


  Background: Url
    Given url "https://reqres.in/"
    * def allUsers = read("classpath:examples/reqres/data/users.json")


  Scenario: Verify id, email, first_name,last_name

    Given path "api/users/"
    And path "2"
    When method get
    Then status 200
    * assert response.data.id == 2
    * assert response.data.email == "janet.weaver@reqres.in"
    * assert response.data.first_name == "Janet"
    * assert response.data.last_name == "Weaver"



  Scenario Outline: Check user list includes  specific users with below ids
    Given path "api/users"
    And path "<id>"
    When method get
    Then status 200
    * def oneUser = response.data
    * match allUsers contains oneUser

    Examples:
      | id |
      | 1  |
      | 2  |
      | 3  |
      | 4  |
      | 5  |
      | 6  |
      | 7  |
      | 8  |
      | 9  |
      | 10 |
      | 11 |
      | 12 |


  Scenario Outline: Check if the avatars is accessible for each user
    Given path "api/users"
    And path "<id>"
    When method get
    Then status 200
    * def avatarUrl = response.data.avatar
    Given url avatarUrl
    When method get
    Then status 200

    Examples:
      | id |
      | 1  |
      | 2  |
      | 3  |
      | 4  |
      | 5  |
      | 6  |
      | 7  |
      | 8  |
      | 9  |
      | 10 |
      | 11 |
      | 12 |


  Scenario Outline: Check with invalid user id
    Given path "api/users"
    And path "<id>"
    When method get
    Then status 404
    * match response == {}

    Examples:
      | id  |
      | 100 |
      | 150 |
      | 200 |
      | 300 |
      | 400 |

