Feature: As a rest service client user, I want easy access to send a request so I can focus on the differentiators.

Scenario: Get a url
  Given I have a "GET" web service
  When I call that "GET" web service
  Then I retrieve data

Scenario: Delete a url
  Given I have a "DELETE" web service
  When I call that "DELETE" web service
  Then I get a 200 response

Scenario Outline: Put/post to a url
  Given I have a "<type>" web service
  When I call that "<type>" web service
  Then I get a 200 response
Examples:
  | type |
  | PUT  |
  | POST |
