class PhotoSeriesController < ApplicationController
  before_action :set_photo_series, only: [:show, :edit, :update, :destroy]
  before_action :get_series


  def get_series
    @parent = Series.find(params[:series_id]) if params[:series_id] 
  end


  # GET /photo_series
  # GET /photo_series.json
  def index
    @photo_series = @parent.photo_series
  end

  # GET /photo_series/1
  # GET /photo_series/1.json
  def show
  end

  # GET /photo_series/new
  def new
    @photo_series = PhotoSeries.new
  end

  # GET /photo_series/1/edit
  def edit
  end

  # POST /photo_series
  # POST /photo_series.json
  def create
    @photo_series = PhotoSeries.new(photo_series_params)
    @photo_series.series=@parent
    @photo_series.user=current_user
    respond_to do |format|
      if @photo_series.save
        format.html { redirect_to @parent, notice: 'Photo series was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo_series }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photo_series/1
  # PATCH/PUT /photo_series/1.json
  def update
    respond_to do |format|
      if @photo_series.update(photo_series_params)
        format.html { redirect_to @parent, notice: 'Photo series was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_series/1
  # DELETE /photo_series/1.json
  def destroy
    @photo_series.destroy
    respond_to do |format|
      format.html { redirect_to @parent }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_series
      @photo_series = PhotoSeries.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_series_params
      params.require(:photo_series).permit(:data, :description)
    end
end
