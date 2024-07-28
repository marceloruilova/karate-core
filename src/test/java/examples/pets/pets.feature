Feature: Pets Api Tests

  Background:
    * url 'https://petstore.swagger.io/v2'

  Scenario Outline: Add a pet to the store
    Given path '/pet'
    And request { "id": <id>, "category": { "id": 1, "name": "Doberman" }, "name": <petName>, "photoUrls": ["string"], "tags": [{"id": 1,"name": "dog-image"}],"status": <petStatus>}
    When method post
    Then status 200
    And match response.id == <id>
    Examples:
      | id | petName | petStatus |
      | 1  | Doge    | available |
      | 2  | Black   | pending   |
      | 3  | Toby    | sold      |
      | 4  | Bailey  | cancelled |
      | 5  | Tobie   | pending   |

  Scenario Outline: Get the pet by ID
    Given path '/pet/<id>'
    When method get
    Then status 200
    And match response.name == "<petName>"
    Examples:
      | id | petName |
      | 1  | Doge    |
      | 2  | Black   |

  Scenario Outline: Update the pet´s name and status
    Given path '/pet/'
    And request { "id": <id>, "category": { "id": 1, "name": "Doberman" }, "name": "<petName>", "photoUrls": ["string"], "tags": [{"id": 1,"name": "dog-image"}],"status": "<petStatus>"}
    When method put
    Then status 200
    And match response.name == "<petName>"
    And match response.status == "<petStatus>"
    Examples:
      | id | petName  | petStatus |
      | 1  | DogeCoin | sold      |
      | 5  | Rufo     | cancelled |

  Scenario Outline: Get pets by status
    And path 'pet/findByStatus'
    And params { status: "<petStatus>" }
    When method get
    Then status 200
    And match response contains { "id": <id>, "category": { "id": 1, "name": "Doberman" }, "name": "<petName>", "photoUrls": ["string"], "tags": [{"id": 1,"name": "dog-image"}],"status": "<petStatus>"}
    Examples:
      | id | petName  | petStatus |
      | 1  | DogeCoin | sold      |
      | 3  | Toby     | sold      |
      | 4  | Bailey   | cancelled |
