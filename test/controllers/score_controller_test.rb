require "test_helper"

class ScoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get score_index_url
    assert_response :success
  end

  test "should get show" do
    get score_show_url
    assert_response :success
  end

  test "should get report" do
    get score_report_url
    assert_response :success
  end

  test "should get statistic" do
    get score_statistic_url
    assert_response :success
  end
end
