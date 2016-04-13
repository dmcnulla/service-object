require 'simplecov'
require 'coveralls'
require 'rspec/expectations'
require 'fig_newton'
require 'cucumber/rspec/doubles'
require 'rubygems'
require 'webmock/cucumber'

puts "Using environment in #{ENV['FIG_NEWTON_FILE']}"
FigNewton.load(ENV['FIG_NEWTON_FILE'])

COVER_FORMAT = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
].freeze

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(COVER_FORMAT)

SimpleCov.start do
  add_filter 'features'
end

require File.expand_path(File.join(File.dirname(__FILE__),
                                   '..', '..', 'lib', 'service-object.rb'))

include RestBaby
