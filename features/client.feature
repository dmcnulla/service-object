Feature: As a rest service client user, I want easy access to send a request so I can focus on the differentiators.

Scenario: Get a url
  Given I have a GET web service
  When I call that web service
  Then I retrieve data
