require "test_helper"

class Api::V1::OrdersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

  def test_show
    get :show
    assert_response :success
  end

end
