class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy,
   :seen, :unseen, :add_to_watchlist, :remove_from_watchlist, :add_trailer, :remove_trailer]
  before_action :get_season

  def get_season
    @parent = Season.find(params[:season_id]) if params[:season_id]
  end

  # GET /episodes
  # GET /episodes.json
  def index
    if @parent
      @episodes = @parent.episodes
    else
      @episodes = Episode.all 
    end
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
    @reviews=@episode.reviews
    if current_user
      if current_user_is_admin?
        @photo_episodes_current_user=@episode.photo_episodes
      else
        @photo_episodes_current_user=@episode.photo_episodes.where(:user_id => current_user.id)
      end
      @review = @episode.reviews.find_by(user_id: current_user.id)
      @trailer = Trailer.find_by(episode: @episode, user: current_user)
      if not @review
        @review = Review.new
      end
    end
  end

  # GET /episodes/new
  def new
    @episode = Episode.new
  end

  # GET /episodes/1/edit
  def edit
  end

  # POST /episodes
  # POST /episodes.json
  def create
    
    if @parent
      @episode = @parent.episodes.new(episode_params)
    else
      @episode = Episode.new(episode_params)
    end

    respond_to do |format|
      if @episode.save
        format.html { redirect_to @parent, notice: 'Episode was successfully created.' }
        format.json { render action: 'episode', status: :created, location: @episode }
      else
        format.html { render action: 'new' }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /episodes/1
  # PATCH/PUT /episodes/1.json
  def update
    respond_to do |format|
      if @episode.update(episode_params)
        format.html { redirect_to [@parent, @episode], notice: 'Episode was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_url(@parent) }
      format.json { head :no_content }
    end
  end

  # GET /episodes/1/seen

  def seen
    current_user.episodes << @episode
    redirect_to [@parent, @episode], notice: 'Episode #{@episode.name} was added to seen list'
  end

  # GET /episodes/1/unseen

  def unseen
    current_user.episodes.delete(@episode)
    redirect_to [@episode.season, @episode], notice: 'Episode #{@episode.name} was removed from seen list'
  end

  # GET /episodes/1/add_to_watchlist
  def add_to_watchlist
    WatchlistEpisode.create(user: current_user, episode: @episode)
    redirect_to [@episode.season, @episode], notice: 'La temporada fue agregada a la watchlist'
  end

  # GET /episodes/1/remove_from_watchlist
  def remove_from_watchlist
    encontrado = WatchlistEpisode.find_by(user:current_user, episode: @episode)
    encontrado.destroy if encontrado 
    redirect_to [@episode.parent, @episode], notice: 'La temporada fue eliminada de la watchlist'
  end

  def add_trailer
    @trailer = Trailer.create(url: params[:video_url], episode: @episode, user: current_user)
    redirect_to @episode, notice: 'Trailer successfully added'
  end

  def remove_trailer
    Trailer.find_by(episode: @episode, user: current_user).destroy
    redirect_to @episode, notice: 'Trailer successfully removed'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      @episode = Episode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def episode_params
      params.require(:episode).permit(:name, :release_date, :description, :number, :season_id)
    end
end
