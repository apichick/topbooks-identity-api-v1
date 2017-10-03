Feature: Identity API (V1) Tests

    Scenario: Get Access Token (Client Credentials) - Success

        Given I have basic authentication credentials `clientId` and `clientSecret`
        And I set Content-Type header to application/x-www-form-urlencoded
        And I set body to grant_type=client_credentials&scope=sfdasdfa
        When I POST to /token
        Then response code should be 200
        And response body should be valid according to openapi description TokenResponse in file swagger.json
	    And response body path $.access_token should be (.*)
        And response body path $.expires_in should be (\d+)
        And response body path $.token_type should be bearer

    Scenario: Get Access Token (Client Credentials) - Unauthorized

        Given I have basic authentication credentials invalid and invalid 
        And I set Content-Type header to application/x-www-form-urlencoded
        And I set body to grant_type=client_credentials&scope=books
        When I POST to /token
        Then response code should be 401
        And response body should be valid according to openapi description Error in file swagger.json
	    And response body path $.code should be 401.01.001
        And response body path $.error should be unauthorized