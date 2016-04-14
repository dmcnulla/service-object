HEADERS = { 'Content-type' => 'application/json' }.freeze
URL = 'http://localhost:9595/test'.freeze
DATA = 'Hello world'.freeze

Given(/^I have a GET web service$/) do
  @mockservice.store_msg('GET', URL, nil, HEADERS, DATA)
end

When(/^I call that web service$/) do
  @client = ServiceObject.new(service_type: 'GET', url: URL, headers: HEADERS)
end

Then(/^I retrieve data$/) do
  @data = @client.send.body
  expect(@data).to eq(DATA)
end
