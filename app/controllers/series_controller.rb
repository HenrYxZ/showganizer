class SeriesController < ApplicationController

  include SeasonsHelper, SeriesHelper

  before_action :set_series, only: [:show, :edit, :update, :destroy,
   :seen, :unseen, :add_to_watchlist, :remove_from_watchlist, :add_trailer, :remove_trailer]
  before_action :get_parent



  def get_parent
    if params[:show_id]
      @parent = Show.find(params[:show_id])
    end
  end

  # GET /series
  # GET /series.json
  def index
    if @parent
      @series = @parent.series
    else
      @series = Series.all
    end
  end

  # GET /series/1
  # GET /series/1.json
  def show
    @seasons=Season.find_all_by_series_id(params[:id])
    if current_user
      if current_user_is_admin?
        @photo_series_current_user=@series.photo_series
        @reviews = @series.reviews
      else
        @photo_series_current_user=@series.photo_series.where(:user_id => current_user.id)
        @reviews = @series.reviews.find_by(user_id: current_user.id)
      end
      
      if not @review
        @review = Review.new
      end
      @trailer = Trailer.find_by(series: @series, user: current_user)
    end
  end

  # GET /series/new
  def new
    @series = Series.new
  end

  # GET /series/1/edit
  def edit
  end

  # POST /series
  # POST /series.json
  def create
    if @parent
      @series = @parent.series.new(series_params)
    else
      @series = Series.new(series_params)
    end
    unless params[:series][:photo_series].nil?
      params[:series][:photo_series].each do |picture|      
        @series.photo_series.new(:data=> picture)
      end
    end
    respond_to do |format|
      if @series.save
        format.html { redirect_to @parent, notice: 'Series was successfully created.' }
        format.json { render action: 'show', status: :created, location: @series }
      else
        format.html { render action: 'new' }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /series/1
  # PATCH/PUT /series/1.json
  def update
    unless params[:series][:photo_series].nil?
      params[:series][:photo_series].each do |picture|      
        @series.photo_series.new(:data=> picture)
      end
    end
    respond_to do |format|
      if @series.update(series_params)
        format.html { redirect_to [@parent, @series], notice: 'Series was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /series/1
  # DELETE /series/1.json
  def destroy
    @series.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_url(@parent) }
      format.json { head :no_content }
    end
  end

  # GET /series/1/unseen
  def seen
    current_user.series << @series
    redirect_to [@parent, @series], notice: 'Series was added to seen list'
  end

  # GET /series/1/unseen
  def unseen
    current_user.series.delete(@series)
    redirect_to [@parent, @series], notice: 'Series was removed from seen list'
  end

  # GET /series/category/:category
  def category
    @series = Series.where(category: params[:category])
  end

  # GET /series/1/add_to_watchlist
  def add_to_watchlist
    add_series_to_watchlist(@series)
    redirect_to [@parent, @series], notice: 'La serie fue agregada a la watchlist'
  end

  # GET /series/1/remove_from_watchlist
  def remove_from_watchlist
    remove_series_from_watchlist(@series) 
    redirect_to [@parent, @series], notice: 'La serie fue eliminada de la watchlist'
  end

  def add_trailer
    @trailer = Trailer.create(url: params[:video_url], series: @series, user: current_user)
    redirect_to @series, notice: 'Trailer successfully added'
  end

  def remove_trailer
    Trailer.find_by(series: @series, user: current_user).destroy
    redirect_to @series, notice: 'Trailer successfully removed'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series
      @series = Series.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def series_params
      params.require(:series).permit(:name, :start_date, :end_date,
      :description, :number, :seasons_id, :category, :photo_series)
    end
end
