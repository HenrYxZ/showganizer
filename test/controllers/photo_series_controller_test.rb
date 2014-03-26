require 'test_helper'

class PhotoSeriesControllerTest < ActionController::TestCase
  setup do
    @photo_series = photo_series(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_series)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo_series" do
    assert_difference('PhotoSeries.count') do
      post :create, photo_series: { path: @photo_series.path, show_id: @photo_series.show_id }
    end

    assert_redirected_to photo_series_path(assigns(:photo_series))
  end

  test "should show photo_series" do
    get :show, id: @photo_series
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo_series
    assert_response :success
  end

  test "should update photo_series" do
    patch :update, id: @photo_series, photo_series: { path: @photo_series.path, show_id: @photo_series.show_id }
    assert_redirected_to photo_series_path(assigns(:photo_series))
  end

  test "should destroy photo_series" do
    assert_difference('PhotoSeries.count', -1) do
      delete :destroy, id: @photo_series
    end

    assert_redirected_to photo_series_index_path
  end
end
