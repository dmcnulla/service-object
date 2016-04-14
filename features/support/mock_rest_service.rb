require 'webmock/cucumber'

include WebMock::API

# Mocking Service for testing rest calls
class MockRestService
  STANDARD = 'http'.freeze
  SECURE = 'https'.freeze

  def initialize(host, port, protocol = STANDARD)
    @protocol = protocol
    @host = host
    @port = port
    @messages = {}
  end

  def store_msg(type, url, request_body, headers, response_body)
    case type.downcase
    when 'get', 'delete'
      WebMock.stub_request(type.downcase.to_sym, url)
             .with(headers: headers)
             .to_return({ status: 200, body: response_body }, headers: {})
    when 'put', 'post'
      WebMock.stub_request(type.downcase.to_sym, url)
             .with(body: request_body,
                   headers: headers)
             .to_return({ status: 200, body: response_body }, headers: {})
    else
      raise "Unsupported type: #{type}"
    end
  end

  def store_get_query(path, headers = {}, user = nil, password = nil)
    new_headers = STANDARD_HEADERS.merge(headers)
    message = path.split('?').last
    auth_string = "#{user}:#{password}@" unless user.nil? || password.nil?
    WebMock.stub_request(:get,
                         "#{@protocol}://#{auth_string}#{@host}:#{@port}#{path}")
           .with(headers: new_headers)
           .to_return({ body: message.to_s, status: 200 }, headers: {})
  end
end
