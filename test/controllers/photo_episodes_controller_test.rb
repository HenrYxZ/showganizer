require 'test_helper'

class PhotoEpisodesControllerTest < ActionController::TestCase
  setup do
    @photo_episode = photo_episodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_episodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo_episode" do
    assert_difference('PhotoEpisode.count') do
      post :create, photo_episode: { episode_id: @photo_episode.episode_id, path: @photo_episode.path }
    end

    assert_redirected_to photo_episode_path(assigns(:photo_episode))
  end

  test "should show photo_episode" do
    get :show, id: @photo_episode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo_episode
    assert_response :success
  end

  test "should update photo_episode" do
    patch :update, id: @photo_episode, photo_episode: { episode_id: @photo_episode.episode_id, path: @photo_episode.path }
    assert_redirected_to photo_episode_path(assigns(:photo_episode))
  end

  test "should destroy photo_episode" do
    assert_difference('PhotoEpisode.count', -1) do
      delete :destroy, id: @photo_episode
    end

    assert_redirected_to photo_episodes_path
  end
end
