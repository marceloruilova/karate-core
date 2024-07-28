Feature: Pets Api Tests

  Background:
    * url 'https://petstore.swagger.io/v2'

  Scenario Outline: Add a pet to the store
    Given path '/pet'
    And request { "id": 1, "category": { "id": 1, "name": <petName> }, "name": "Doge", "photoUrls": ["string"], "tags": [{"id": 1,"name": "dog-image"}],"status": <petStatus>}
    When method post
    Then status 200
    And match response.id == 1
    Examples:
      | petName | petStatus |
      | Doge    | available |
      | Black   | pending   |
      | Bailey  | cancelled   |

  Scenario: Get the pet by ID
    Given path '/pet/1'
    When method get
    Then status 200
    And match response.name == "Doge"

  Scenario: Update the pet´s name and status
    Given path '/pet/'
    And request { "id": 1, "category": { "name": "Doberman" }, "name": "DogeCoin", "photoUrls": ["string"], "tags": [{"id": 1,"name": "dog-image"}],"status": "cancelled"}
    When method put
    Then status 200
    And match response.name == "DogeCoin"
    And match response.status == "cancelled"

  Scenario: Get the pet by status
    And path 'pet/findByStatus'
    And params { status: 'cancelled' }
    When method get
    Then status 200
    And match response contains { "id": 1, "category": { "id": 0, "name": "Doberman" }, "name": "DogeCoin", "photoUrls": ["string"], "tags": [{"id": 1,"name": "dog-image"}],"status": "cancelled"}