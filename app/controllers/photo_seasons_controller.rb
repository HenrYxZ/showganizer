class PhotoSeasonsController < ApplicationController
  before_action :set_photo_season, only: [:show, :edit, :update, :destroy]
  before_action :get_season


  def get_season
    @parent = Season.find(params[:season_id]) if params[:season_id] 
  end

  # GET /photo_seasons
  # GET /photo_seasons.json
  def index
    @photo_seasons = PhotoSeason.all
  end

  # GET /photo_seasons/1
  # GET /photo_seasons/1.json
  def show
  end

  # GET /photo_seasons/new
  def new
    @photo_season = PhotoSeason.new
  end

  # GET /photo_seasons/1/edit
  def edit
  end

  # POST /photo_seasons
  # POST /photo_seasons.json
  def create
    @photo_season = PhotoSeason.new(photo_season_params)
    @photo_season.season=@parent
    @photo_season.user=current_user
    respond_to do |format|
      if @photo_season.save
        format.html { redirect_to [@parent.series,@parent], notice: 'Photo season was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo_season }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo_season.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photo_seasons/1
  # PATCH/PUT /photo_seasons/1.json
  def update
    respond_to do |format|
      if @photo_season.update(photo_season_params)
        format.html { redirect_to @photo_season, notice: 'Photo season was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo_season.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_seasons/1
  # DELETE /photo_seasons/1.json
  def destroy
    @photo_season.destroy
    respond_to do |format|
      format.html { redirect_to @parent }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_season
      @photo_season = PhotoSeason.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_season_params
      params.require(:photo_season).permit(:description, :show_id,:user_id,:data)
    end
end
