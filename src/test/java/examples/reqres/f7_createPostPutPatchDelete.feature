Feature:

  Background:
    Given url "https://reqres.in/"


  Scenario: Create a user with certain name and job and verify if it is created
    Given path "api/users"
    And request person = { "name": "yunus", "job": "tester" }
    When method post
    Then status 201
    * match response.createdAt != null
    * match response.name == person.name
    * match response.job == person.job


  Scenario Outline: Create multiple users with given data and verify if all of them are created
    Given path "api/create"
    * def person = {"name": "<name>", "job": "<job>"}
    And request person
    When method post
    Then status 201
    * match response.createdAt != null
    * match response.name == person.name
    * match response.job == person.job



    Examples:
      | name | job       |
      | John | SDET      |
      | Ally | Developer |
      | Jack | Tester    |


  Scenario:Update one user and verify if it is updated (put)
    Given path "api/users"
    Given path id = 45
    * def person = {name :'Jane', job:'Tester'}
    And request person
    When method put
    Then status 200
    * print response
    * match response.name == person.name
    * match response.job == person.job


  Scenario Outline: Update users with following ids 134,135,136 (put) and verify updating
    Given path "api/users"
    Given path id = "<id>"
    * def person = {name :"<name>", job:"<job>"}
    And request person
    When method put
    Then status 200
    * match response.name == person.name
    * match response.job == person.job

    Examples:
      | id  | name | job       |
      | 134 | Sam  | Tester    |
      | 135 | John | Developer |
      | 136 | Eden | QA        |


  Scenario:Update one user and verify if it is updated (patch)
    Given path "api/users"
    Given path id = 45
    * def person = {job:'Developer'}
    And request person
    When method patch
    Then status 200
    * match response.job == person.job


  Scenario Outline: Update users with following ids 121,122,123 (patch) and verify updating
    Given path "api/users"
    Given path id = "<id>"
    * def person = {job:"<job>"}
    And request person
    When method put
    Then status 200
    * match response.job == person.job

    Examples:
      | id  | job       |
      | 121 | Tester    |
      | 122 | Developer |
      | 123 | QA        |


  Scenario: Delete one user and verify if it is deleted (delete)
    Given path "api/users"
    Given path "145"
    When method delete
    Then status 204


  Scenario Outline: Delete users with following ids 121,122,123 (delete)
    Given path "api/users"
    Given path "<id>"
    When method delete
    Then status 204

    Examples:
      | id  |
      | 121 |
      | 122 |
      | 123 |
