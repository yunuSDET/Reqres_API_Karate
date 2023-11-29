
Feature:Register functionality

  Background:
    Given url "https://reqres.in/"


  Scenario: Register a user with given email and password and verify if token is not null
    Given path "api/register"
    * def credentials = {"email": "eve.holt@reqres.in","password": "pistol"}
    And request credentials
    When method post
    Then status 200
    * match response.token != null


  Scenario Outline: Register 4 different users with given emails and passwords and verify if tokens are not null
    Given path "api/register"
    * def credentials = {"email": "<email>","password": "<password>"}
    And request credentials
    When method post
    Then status 200
    * match response.token != null

    Examples:
      | email                      | password |
      | michael.lawson@reqres.in   | secret   |
      | lindsay.ferguson@reqres.in | secret   |
      | tobias.funke@reqres.in     | secret   |
      | byron.fields@reqres.in     | secret   |


  Scenario: Try to register a user with a given email and verify if error message is "Missing password"
    Given path "api/register"
    * def credentials = {"email": "michael.lawson@reqres.in "}
    And request credentials
    When method post
    Then status 400
    * match response.error == "Missing password"


  Scenario Outline: Try to register 4 different users with given emails and verify that  error message is "Missing password" for each of them
    Given path "api/register"
    * def credentials = {"email": "<email>"}
    And request credentials
    When method post
    Then status 400
    * match response.error == "Missing password"

    Examples:
      | email                      |
      | michael.lawson@reqres.in   |
      | lindsay.ferguson@reqres.in |
      | tobias.funke@reqres.in     |
      | byron.fields@reqres.in     |




  Scenario: Login a valid email and password and verify if token is not null
    Given path "api/login"
    * def credentials = {"email": "eve.holt@reqres.in","password": "cityslicka"}
    And request credentials
    When method post
    Then status 200
    * match response.token != null



  Scenario Outline: Login 4 different users with valid emails and passwords and verify if tokens are not null
    Given path "api/login"
    * def credentials = {"email": "<email>","password": "<password>"}
    And request credentials
    When method post
    Then status 200
    * match response.token != null

    Examples:
      | email                      | password |
      | michael.lawson@reqres.in   | secret   |
      | lindsay.ferguson@reqres.in | secret   |
      | tobias.funke@reqres.in     | secret   |
      | byron.fields@reqres.in     | secret   |




  Scenario: Try to login with an email and verify if error message is "Missing password"
    Given path "api/login"
    * def credentials = {"email": "michael.lawson@reqres.in "}
    And request credentials
    When method post
    Then status 400
    * match response.error == "Missing password"



  Scenario Outline: Try to login as 4 different users with given emails and verify that  error message is "Missing password" for each of them
    Given path "api/login"
    * def credentials = {"email": "<email>"}
    And request credentials
    When method post
    Then status 400
    * match response.error == "Missing password"

    Examples:
      | email                      |
      | michael.lawson@reqres.in   |
      | lindsay.ferguson@reqres.in |
      | tobias.funke@reqres.in     |
      | byron.fields@reqres.in     |

