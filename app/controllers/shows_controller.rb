class ShowsController < ApplicationController
  before_action :current_user_is_admin?, only: [:edit,:update,:create]
  before_action :set_show, only: [:show, :edit, :update, :destroy, :seen,
   :unseen, :add_to_watchlist, :remove_from_watchlist, :add_trailer, :remove_trailer]
  before_action :set_shows, only: [:index]

  include SeasonsHelper, SeriesHelper, ShowsHelper

  # GET /shows
  # GET /shows.json
  def index
    if params[:search]
      @shows = Show.search(params[:search])
    else
      @shows = Show.all
    end
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
    @series= Series.find_all_by_show_id(params[:id])
    @movies= Movie.find_all_by_show_id(params[:id])

    if current_user
      @reviews = Review.where(show: @show)
      @review = @show.reviews.find_by(user_id: current_user.id)
      if current_user_is_admin?
        @photo_shows_current_user=@show.photo_shows
      else
        @photo_shows_current_user=@show.photo_shows.where(:user_id => current_user.id)
      end
      if not @review
        @review = Review.new
      end
      @trailer = Trailer.find_by(show: @show, user: current_user)
    end
  end

  # GET /shows/new
  def new
    @show = Show.new
  end

  # GET /shows/1/edit
  def edit
  end

  # POST /shows
  # POST /shows.json
  def create
    @show = Show.new(show_params)
    unless params[:show][:photo_shows].nil?
      params[:show][:photo_shows].each do |picture|      
        @show.photo_shows.new(:data=> picture)
      end
    end
    respond_to do |format|
      if @show.save
        format.html { redirect_to shows_url, notice: 'Show was successfully created.' }
        format.json { render action: 'show', status: :created, location: @show }
      else
        format.html { render action: 'new' }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shows/1
  # PATCH/PUT /shows/1.json
  def update
    @show.photo_shows=[]
    unless params[:show][:photo_shows].nil?
      params[:show][:photo_shows].each do |picture|      
        @show.photo_shows.new(:data=> picture)
      end
    end
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to @show, notice: 'Show was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @show.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  # GET /shows/1/seen

  def seen
    Seen.create(show: @show, user: current_user)
    redirect_to @show, notice: "Show #{ @show.name } was added to seen list"
  end

  # GET /shows/1/unseen

  def unseen
    current_user.shows.delete(@show)
    redirect_to @show, notice: "Show #{ @show.name } was removed from seen list"
  end

  # GET /shows/category/:category
  def category
    @shows = Show.where(category: params[:category])
  end

  # GET /shows/1/add_to_watchlist
  def add_to_watchlist
    add_show_to_watchlist(@show)
    redirect_to @show, notice: 'Show was successfully added to watchlist'
  end

  # GET /shows/1/remove_from_watchlist
  def remove_from_watchlist
    remove_show_from_watchlist(@show)
    redirect_to @show, notice: 'Show was successfully removed from watchlist'
  end

  def add_trailer
    @trailer = Trailer.create(url: params[:video_url], show: @show, user: current_user)
    redirect_to @show, notice: 'Trailer successfully added'
  end

  def remove_trailer
    Trailer.find_by(show: @show, user: current_user).destroy
    redirect_to @show, notice: 'Trailer successfully removed'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params[:id])
    end

    def set_shows
      @shows = Show.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def show_params
      params.require(:show).permit(:name, :start_date, :end_date, :type_of_show, :description, :category, :photo_shows)
    end

end
