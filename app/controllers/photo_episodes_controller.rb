class PhotoEpisodesController < ApplicationController
  before_action :set_photo_episode, only: [:show, :edit, :update, :destroy]
  before_action :get_episode

  def get_episode
    @parent = Episode.find(params[:episode_id]) if params[:episode_id] 
  end
  # GET /photo_episodes
  # GET /photo_episodes.json
  def index
    @photo_episodes = PhotoEpisode.all
  end

  # GET /photo_episodes/1
  # GET /photo_episodes/1.json
  def show
  end

  # GET /photo_episodes/new
  def new
    @photo_episode = PhotoEpisode.new
  end

  # GET /photo_episodes/1/edit
  def edit
  end

  # POST /photo_episodes
  # POST /photo_episodes.json
  def create
    @photo_episode = PhotoEpisode.new(photo_episode_params)
    @photo_episode.episode=@parent
    @photo_episode.user=current_user
    respond_to do |format|
      if @photo_episode.save
        format.html { redirect_to @parent, notice: 'Photo episode was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo_episode }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo_episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photo_episodes/1
  # PATCH/PUT /photo_episodes/1.json
  def update
    respond_to do |format|
      if @photo_episode.update(photo_episode_params)
        format.html { redirect_to @photo_episode, notice: 'Photo episode was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo_episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_episodes/1
  # DELETE /photo_episodes/1.json
  def destroy
    @photo_episode.destroy
    respond_to do |format|
      format.html { redirect_to [@parent.season,@parent] }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_episode
      @photo_episode = PhotoEpisode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_episode_params
      params.require(:photo_episode).permit(:description,:data,:user_id, :episode_id)
    end
end
