require 'simplecov'
require 'coveralls'
require 'rspec/expectations'
require 'cucumber/rspec/doubles'
require 'rubygems'
require 'webmock/cucumber'

COVER_FORMAT = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
].freeze

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(COVER_FORMAT)

SimpleCov.start do
  add_filter 'features'
end

require 'service-object'

include RestBaby

HOST = 'localhost'.freeze
PORT = 9595
PROTOCOL = 'http'.freeze
