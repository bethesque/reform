require 'test_helper'

class MethodTest < MiniTest::Spec # TODO: remove me in 2.0.
  Request = Struct.new(:method)

  class RequestForm < Reform::Form
    property :method
  end

  let (:request) { Request.new }
  let (:form) { RequestForm.new(request) }

  it do
    form.validate("method" => "get")
    form.sync
    request.method.must_equal "get"
  end
end