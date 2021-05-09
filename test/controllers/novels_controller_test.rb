require 'test_helper'

class NovelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get novels_index_url
    assert_response :success
  end

end
