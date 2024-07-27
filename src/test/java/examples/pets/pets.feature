Feature: Pets Api Tests
  Scenario: Add a pet to the store
    Given url 'https://petstore.swagger.io/v2'
    And path 'pet'
    And request { "id": 1, "category": { "id": 1, "name": "Doberman" }, "name": "Doge", "photoUrls": ["string"], "tags": [{"id": 1,"name": "dog-image"}],"status": "available"}
    When method post
    Then status 200
    And match response.id == 1

  Scenario: Get the pet by ID
    Given url 'https://petstore.swagger.io/v2'
    And path 'pet/1'
    When method get
    Then status 200
    And match response.name == "Doge"

  Scenario: Update the pet´s name and status
    Given url 'https://petstore.swagger.io/v2'
    And path 'pet/1'
    And request { "id": 1, "category": { "name": "Doberman" }, "name": "DogeCoin", "photoUrls": ["string"], "tags": [{"id": 1,"name": "dog-image"}],"status": "cancelled"}
    When method put
    Then status 200
    And match response.name == "DogeCoin"
    And match response.status == "cancelled"
