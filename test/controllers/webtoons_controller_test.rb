require "test_helper"

class WebtoonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get webtoons_index_url
    assert_response :success
  end

  test "should get webtoon_list" do
    get webtoons_webtoon_list_url
    assert_response :success
  end

  test "should get webtoon_detail" do
    get webtoons_webtoon_detail_url
    assert_response :success
  end
end
