require 'test_helper'

class PhotoSeasonsControllerTest < ActionController::TestCase
  setup do
    @photo_season = photo_seasons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_seasons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo_season" do
    assert_difference('PhotoSeason.count') do
      post :create, photo_season: { path: @photo_season.path, show_id: @photo_season.show_id }
    end

    assert_redirected_to photo_season_path(assigns(:photo_season))
  end

  test "should show photo_season" do
    get :show, id: @photo_season
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo_season
    assert_response :success
  end

  test "should update photo_season" do
    patch :update, id: @photo_season, photo_season: { path: @photo_season.path, show_id: @photo_season.show_id }
    assert_redirected_to photo_season_path(assigns(:photo_season))
  end

  test "should destroy photo_season" do
    assert_difference('PhotoSeason.count', -1) do
      delete :destroy, id: @photo_season
    end

    assert_redirected_to photo_seasons_path
  end
end
