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
      | read('data/newPet.csv') |

  Scenario: Add a pet with missing status
    Given path '/pet'
    And request { "id": 45, "category": { "id": 1, "name": "Doberman" }, "name": "Petra", "photoUrls": ["string"], "tags": [{"id": 1,"name": "dog-image"}]}
    When method post
    Then status 200
    And match response.id == 45

  Scenario: Add a pet with missing name
    Given path '/pet'
    And request { "id": 49, "category": { "id": 1, "name": "Doberman" }, "photoUrls": ["string"], "tags": [{"id": 1,"name": "dog-image"}],"status": "available"}
    When method post
    Then status 200
    And match response.id == 49

  Scenario Outline: Get the pet by ID
    Given path '/pet/<id>'
    When method get
    Then status 200
    And match response.name == "<petName>"
    Examples:
      | read('data/newPet.csv') |

  Scenario Outline: Update the pet´s name and status
    Given path '/pet/'
    And request { "id": <id>, "category": { "id": 1, "name": "Doberman" }, "name": "<petName>", "photoUrls": ["string"], "tags": [{"id": 1,"name": "dog-image"}],"status": "<petStatus>"}
    When method put
    Then status 200
    And match response.name == "<petName>"
    And match response.status == "<petStatus>"
    Examples:
      | read('data/updatePet.csv') |

  Scenario Outline: Get pets by status
    And path 'pet/findByStatus'
    And params { status: "<petStatus>" }
    When method get
    Then status 200
    And match response contains { "id": <id>, "category": { "id": 1, "name": "Doberman" }, "name": "<petName>", "photoUrls": ["string"], "tags": [{"id": 1,"name": "dog-image"}],"status": "<petStatus>"}
    Examples:
      | read('data/getByStatusPet.csv') |
