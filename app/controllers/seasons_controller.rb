class SeasonsController < ApplicationController

  include SeasonsHelper

  before_action :set_season, only: [:show, :edit, :update, :destroy,
   :seen, :unseen, :add_to_watchlist, :remove_from_watchlist, :add_trailer, :remove_trailer]
  before_action :get_series

  def get_series
    @parent = Series.find(params[:series_id]) if params[:series_id] 
  end

  # GET /seasons
  # GET /seasons.json
  def index
    if @parent
      @seasons = @parent.seasons
    else
      @seasons = Season.all
    end
  end

  # GET /seasons/1
  # GET /seasons/1.json
  def show
    @episodes=Episode.find_all_by_season_id(@season.id)
    @reviews = Review.where(season: @season)

    if current_user
      if current_user_is_admin?
        @photo_seasons_current_user=@season.photo_seasons
      else
        @photo_seasons_current_user=@season.photo_seasons.where(:user_id => current_user.id)
      end
      @review = @season.reviews.find_by(user_id: current_user.id)
      if not @review
        @review = Review.new
      end
      @trailer = Trailer.find_by(season: @season, user: current_user)
    end
  end

  # GET /seasons/new
  def new
    @season = Season.new
  end

  # GET /seasons/1/edit
  def edit
  end

  # POST /seasons
  # POST /seasons.json
  def create
    if @parent
      @season = @parent.seasons.new(season_params)
    else
      @season = Season.new(season_params)
    end
    unless params[:season][:photo_seasons].nil?
      params[:season][:photo_seasons].each do |picture|      
        @season.photo_seasons.new(:data=> picture)
      end
    end
    respond_to do |format|
      if @season.save
        format.html { redirect_to @parent, notice: 'Season was successfully created.' }
        format.json { render action: 'show', status: :created, location: @season }
      else
        format.html { render action: 'new' }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seasons/1
  # PATCH/PUT /seasons/1.json
  def update
    @season.photo_seasons=[]
    unless params[:season][:photo_seasons].nil?
      params[:season][:photo_seasons].each do |picture|      
        @season.photo_seasons.new(:data=> picture)
      end
    end
    respond_to do |format|
      if @season.update(season_params)
        format.html { redirect_to [@parent, @season], notice: 'Season was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seasons/1
  # DELETE /seasons/1.json
  def destroy
    @season.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_url(@parent) }
      format.json { head :no_content }
    end
  end

  # GET /seasons/1/seen

  def seen
    current_user.seasons << @season
    redirect_to [@parent, @season], notice: 'Season #{@season.name} was added to seen list'
  end

  # GET /seasons/1/unseen

  def unseen
    current_user.seasons.delete(@season)
    redirect_to [@parent, @season], notice: 'Season #{@season.name} was removed from seen list'
  end

  # GET /seasons/1/add_to_watchlist
  def add_to_watchlist
    add_season_to_watchlist(@season)
    redirect_to [@parent, @season], notice: 'La temporada fue agregada a la watchlist'
  end

  # GET /seasons/1/remove_from_watchlist
  def remove_from_watchlist
    remove_season_from_watchlist(@season)
    redirect_to [@parent, @season], notice: 'La temporada fue eliminada de la watchlist'
  end

  def add_trailer
    @trailer = Trailer.create(url: params[:video_url], season: @season, user: current_user)
    redirect_to @season, notice: 'Trailer successfully added'
  end

  def remove_trailer
    Trailer.find_by(season: @season, user: current_user).destroy
    redirect_to @season, notice: 'Trailer successfully removed'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_season
      @season = Season.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def season_params
      params.require(:season).permit(:name, :start_date, :end_date, :description, :number, :serie_id)
    end
end
