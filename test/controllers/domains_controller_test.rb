require 'test_helper'

class DomainsControllerTest < ActionController::TestCase
  test "should get dispatch" do
    get :dispatch
    assert_response :success
  end

end
