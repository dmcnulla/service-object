# service_object.rb
# @author Dave McNulla
# Originated: 2016
# This library was written to create page-object-like behavior in rest services.

require 'rest_baby'

include RestBaby

# ServiceObject is a small rest client assistant.
# @private
class ServiceClient
  DEFAULT_ARGS = {
    url: 'http://localhost:80',
    user: '',
    password: '',
    service_object: {
      service_type: 'GET',
      path: '',
      #data_type: 'application/json',
      fields: [],
      parameters: []
    },
    headers: {}
  }.freeze

  attr_reader :client, :service_type, :data_type, :fields, :headers, :response

  def initialize(args)
    args = DEFAULT_ARGS.merge(args)
    @uri = URI.parse("#{args[:url]}#{args[:service_object][:path]}")
    @headers = args[:headers]
    @user = args[:user]
    @password = args[:password]
    @service_type = args[:service_object][:service_type].downcase.to_sym
    @client = Client.new(@uri, @headers, @user, @password)
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
