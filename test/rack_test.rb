require 'bloc_works'
require 'test/unit'
require 'rack/test'

class CallTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    BlocWorks::Application.new
  end

  def test_call
    get "/"
    assert last_response.ok?
    assert_equal last_response.body, "Hello Blocheads!"
  end

  def set_request_headers
    get "/"
    assert last_response.ok?
    assert_equal last_response.body, "Hello Blocheads!"
  end

end
