@wip
@service

Feature: As a rest client, I want easy definition of the service objects so I can use them with little work

Scenario: Get a url
  Given I have a web service for "get_people"
  When I call the web service
  Then I retrieve the following data
    | name        | ~full_name                                            |
    | username    | ~user_name                                            |
    | address     | ~street_address                                       |
    | email       | ~email_address                                        |
    | pay_type    | ~randomize ['Credit card', 'Purchase order', 'Check'] |
    | card_type   | ~credit_card_type                                     |
    | card_number | ~credit_card_number                                   |