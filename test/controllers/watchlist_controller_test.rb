require 'test_helper'

class WatchlistControllerTest < ActionController::TestCase
  test "should get shows" do
    get :shows
    assert_response :success
  end

  test "should get movies" do
    get :movies
    assert_response :success
  end

  test "should get series" do
    get :series
    assert_response :success
  end

  test "should get seasons" do
    get :seasons
    assert_response :success
  end

  test "should get episodes" do
    get :episodes
    assert_response :success
  end

end
