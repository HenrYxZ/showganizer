require 'test_helper'

class PhotoShowsControllerTest < ActionController::TestCase
  setup do
    @photo_show = photo_shows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_shows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo_show" do
    assert_difference('PhotoShow.count') do
      post :create, photo_show: { path: @photo_show.path, show_id: @photo_show.show_id }
    end

    assert_redirected_to photo_show_path(assigns(:photo_show))
  end

  test "should show photo_show" do
    get :show, id: @photo_show
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo_show
    assert_response :success
  end

  test "should update photo_show" do
    patch :update, id: @photo_show, photo_show: { path: @photo_show.path, show_id: @photo_show.show_id }
    assert_redirected_to photo_show_path(assigns(:photo_show))
  end

  test "should destroy photo_show" do
    assert_difference('PhotoShow.count', -1) do
      delete :destroy, id: @photo_show
    end

    assert_redirected_to photo_shows_path
  end
end
