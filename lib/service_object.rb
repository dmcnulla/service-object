# service_object.rb
# @author Dave McNulla
# Originated: 2011
# This library was written to simplify communications with rest services.

require 'rest_baby'

DEFAULT_ARGS = {
  url: 'http://localhost:80',
  user: '',
  password: '',
  service_type: 'GET',
  data_type: 'application/json',
  fields: [],
  parameters: [],
  headers: {}
}.freeze

include RestBaby

# ServiceObject is a small rest client assistant.
# @private
class ServiceObject
  attr_reader :client, :service_type, :data_type, :fields, :headers, :response

  def initialize(args)
    args = DEFAULT_ARGS.merge(args)
    @client = Client.new(URI(args[:url]), args[:user], args[:password])
  end

  def send(path = '/')
    @client.get(path)
  end
end
