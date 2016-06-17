
Given(/^I have a web service for "([^"]*)"$/) do |service_name|
  read_service(service_name)
end

When(/^I call the web service$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I retrieve the following data$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end
