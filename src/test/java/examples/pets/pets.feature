Feature: Pets Api Tests

  Background:
    * url 'https://petstore.swagger.io/v2'
    * def newPet = read('json/newPet.json')
    * def petNoStatus = read('json/petNoStatus.json')
    * def petNoName = read('json/petNoName.json')

  Scenario Outline: Add a pet to the store
    Given path '/pet'
    And request newPet
    When method post
    Then status 200
    And match response.id == <id>
    Examples:
      | read('csv/newPet.csv') |

  Scenario: Add a pet with missing status
    Given path '/pet'
    And request petNoStatus
    When method post
    Then status 200
    And match response.id == 45

  Scenario: Add a pet with missing name
    Given path '/pet'
    And request petNoName
    When method post
    Then status 200
    And match response.id == 49

  Scenario Outline: Get the pet by ID
    Given path '/pet/<id>'
    When method get
    Then status 200
    And match response.name == "<petName>"
    Examples:
      | read('csv/newPet.csv') |

  Scenario Outline: Update the pet´s name and status
    Given path '/pet/'
    And request newPet
    When method put
    Then status 200
    And match response.name == "<petName>"
    And match response.status == "<petStatus>"
    Examples:
      | read('csv/updatePet.csv') |

  Scenario Outline: Get pets by status
    Given path 'pet/findByStatus'
    And params { status: "<petStatus>" }
    When method get
    Then status 200
    And match response contains { "id": <id>, "category": { "id": 1, "name": "Doberman" }, "name": "<petName>", "photoUrls": ["string"], "tags": [{"id": 1,"name": "dog-image"}],"status": "<petStatus>"}
    Examples:
      | read('csv/getByStatusPet.csv') |
