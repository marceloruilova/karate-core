Feature: Pets Api Tests
  Scenario: Add a pet to the store
    Given url 'https://petstore.swagger.io/v2'
    And path 'pet'
    And request { "id": 1, "category": { "id": 1, "name": "Doberman" }, "name": "Doge", "photoUrls": ["string"], "tags": [{"id": 1,"name": "dog-image"}],"status": "available"}
    When method post
    Then status 200
    And match response.id == 1