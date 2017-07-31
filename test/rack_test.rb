require 'bloc_works'
require 'test/unit'
require 'rack/test'

class CallTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    BlocWorks::Application.new
  end

  def test_call
    get "/books/welcome"
    assert last_response.ok?
    assert_equal "text/html", last_response.body
  end

  def test_request_headers
    get "/"
    assert last_response.ok?
    assert_equal "text/html", last_response.get_header("Content-Type")
  end

  def test_favicon_page
    get "/favicon.ico"
    assert !last_response.ok?
  end

end
