require 'test_helper'

class PhotoMoviesControllerTest < ActionController::TestCase
  setup do
    @photo_movie = photo_movies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_movies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo_movie" do
    assert_difference('PhotoMovie.count') do
      post :create, photo_movie: { path: @photo_movie.path, show_id: @photo_movie.show_id }
    end

    assert_redirected_to photo_movie_path(assigns(:photo_movie))
  end

  test "should show photo_movie" do
    get :show, id: @photo_movie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo_movie
    assert_response :success
  end

  test "should update photo_movie" do
    patch :update, id: @photo_movie, photo_movie: { path: @photo_movie.path, show_id: @photo_movie.show_id }
    assert_redirected_to photo_movie_path(assigns(:photo_movie))
  end

  test "should destroy photo_movie" do
    assert_difference('PhotoMovie.count', -1) do
      delete :destroy, id: @photo_movie
    end

    assert_redirected_to photo_movies_path
  end
end
