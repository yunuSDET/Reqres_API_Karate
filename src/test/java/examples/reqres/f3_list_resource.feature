Feature: List Resource Functionality

  Background: Url
    Given url "https://reqres.in/"


  Scenario: Verify page, per_page, total, total_pages
    Given path "api/unknown"
    When method get
    Then status 200
    * match response.page == 1
    * match response.per_page == 6
    * match response.total == 12
    * match response.total_pages == 2



  Scenario: List all data with 2000 and 2001 years
    Given path "api/unknown"
    When method get
    Then status 200
    * def dataList = response.data.filter(i=>i.year==2000 || i.year==2001)
    * print dataList


    Scenario:Verify that all color codes starts with "#" and have 7 characters (including "#")
      Given path "api/unknown"
      When method get
      Then status 200
      * def filtered = response.data.filter(i=>i.color.startsWith("#") && i.color.length==7)
      * match filtered == response.data



      Scenario: Verify that all the value of pantone_values in following format "##-####"
        Given path "api/unknown"
        When method get
        Then status 200
        * def pantoneValueListSize = response.data.filter(i=>i.pantone_value.length == 7 && i.pantone_value.charAt(2) == "-").length
        * match pantoneValueListSize == response.data.length
        * print pantoneValueListSize



