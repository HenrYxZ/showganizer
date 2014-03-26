require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  setup do
    @review = reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post :create, review: { body: @review.body, episode_id: @review.episode_id, movie_id: @review.movie_id, rating: @review.rating, season_id: @review.season_id, series_id: @review.series_id, show_id: @review.show_id, title: @review.title, user_id: @review.user_id }
    end

    assert_redirected_to review_path(assigns(:review))
  end

  test "should show review" do
    get :show, id: @review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @review
    assert_response :success
  end

  test "should update review" do
    patch :update, id: @review, review: { body: @review.body, episode_id: @review.episode_id, movie_id: @review.movie_id, rating: @review.rating, season_id: @review.season_id, series_id: @review.series_id, show_id: @review.show_id, title: @review.title, user_id: @review.user_id }
    assert_redirected_to review_path(assigns(:review))
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete :destroy, id: @review
    end

    assert_redirected_to reviews_path
  end
end
