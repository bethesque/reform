require 'test_helper'

class MethodTest < MiniTest::Spec # TODO: remove me in 2.0.
  Request = Struct.new(:http_method)

  class RequestForm < Reform::Form
    property :http_method
  end

  let (:request) { Request.new }
  let (:form) { RequestForm.new(request) }

  it do
    form.validate("http_method" => "get")
    form.sync
    request.http_method.must_equal "get"
  end
end