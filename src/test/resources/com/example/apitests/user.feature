Feature: User operations

  Scenario: Create a user
    Given url 'https://petstore.swagger.io/v2/user'
    And request { "id": 1, "username": "testuser", "firstName": "Test", "lastName": "User", "email": "testuser@example.com", "password": "password", "phone": "1234567890", "userStatus": 1 }
    When method post
    Then status 200
    And match response == { "code": 200, "type": "unknown", "message": "ok" }

  Scenario: Get the user
    Given url 'https://petstore.swagger.io/v2/user/testuser'
    When method get
    Then status 200
    And match response.username == 'testuser'

  Scenario: Update the user
    Given url 'https://petstore.swagger.io/v2/user/testuser'
    And request { "id": 1, "username": "testuser", "firstName": "Updated", "lastName": "User", "email": "updateduser@example.com", "password": "password", "phone": "1234567890", "userStatus": 1 }
    When method put
    Then status 200
    And match response == { "code": 200, "type": "unknown", "message": "ok" }

  Scenario: Get the updated user
    Given url 'https://petstore.swagger.io/v2/user/testuser'
    When method get
    Then status 200
    And match response.email == 'updateduser@example.com'

  Scenario: Delete the user
    Given url 'https://petstore.swagger.io/v2/user/testuser'
    When method delete
    Then status 200
    And match response == { "code": 200, "type": "unknown", "message": "ok" }
