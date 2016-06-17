HEADERS = {} # { 'Content-type' => 'application/json' }.freeze
URL = 'http://localhost:9595/test'.freeze
DATA = "{ 'test': 'something' }".freeze

Given(/^I have a "([^"]*)" web service$/) do |type|
  case type
  when 'GET'
    @mockservice.store_msg('GET', URL, nil, DATA)
  else
    @mockservice.store_msg(type, URL, nil, nil)
  end
end

When(/^I call that "([^"]*)" web service$/) do |type|
  @client = ServiceClient.new({ service_object: { service_type: type }, url: URL, headers: HEADERS })
  @response = @client.send
end

Then(/^I retrieve data$/) do
  @data = @response.body
  expect(@data).to eq(DATA)
end

Then(/^I get a 200 response$/) do
  @code = @response.code.to_i
  expect(@code).to eq(200)
end
