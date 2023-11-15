Feature:

  Background: Url

    Given url "http://54.175.152.79:8000/"



  Scenario:Update one user and verify if it is updated (put)
    Given path "api/spartans"
    Given path id = 120
    * def person = {gender: "Female",name: "Aysel",phone: 5412598745}
    And request person
    When method put
    Then status 204
    * print response +" yunus"
    Given path "api/spartans"
    Given path id = 120
    When method get
    Then status 200
    * match response.gender == person.gender
    * match response.name == person.name
    * match response.phone == person.phone




