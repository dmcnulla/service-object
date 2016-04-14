# service_object.rb
# @author Dave McNulla
# Originated: 2011
# This library was written to simplify communications with rest services.

require 'rest_baby'

include RestBaby

# ServiceObject is a small rest client assistant.
# @private
class ServiceObject
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

  attr_reader :client, :service_type, :data_type, :fields, :headers, :response

  def initialize(args)
    args = DEFAULT_ARGS.merge(args)
    @uri = URI.parse(args[:url])
    @headers = args[:headers]
    # @user = args[:user]
    # @password = args[:password]
    @service_type = args[:service_type].downcase.to_sym
    @client = Client.new(@uri, @headers, args[:user], args[:password])
  end

  def send
    case @service_type
    when :get
      @client.get
    when :delete
      @client.delete
    when :put
      @client.put
    when :post
      @client.post
    end
  end
end
