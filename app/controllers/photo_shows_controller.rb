class PhotoShowsController < ApplicationController
  before_action :set_photo_show, only: [:show, :edit, :update, :destroy]
  before_action :get_show
  # GET /photo_shows
  # GET /photo_shows.json

    def get_show
      @parent = Show.find(params[:show_id]) if params[:show_id] 
    end

    def index
      @photo_shows = @parent.photo_shows
    end

  # GET /photo_shows/1
  # GET /photo_shows/1.json
  def show
  end

  # GET /photo_shows/new
  def new
    @photo_show = PhotoShow.new
  end

  # GET /photo_shows/1/edit
  def edit
  end

  # POST /photo_shows
  # POST /photo_shows.json
  def create
    @photo_show = PhotoShow.new(photo_show_params)
    @photo_show.show=@parent
    @photo_show.user=current_user
    respond_to do |format|
      if @photo_show.save
        format.html { redirect_to @parent, notice: 'Photo show was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo_show }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photo_shows/1
  # PATCH/PUT /photo_shows/1.json
  def update
    respond_to do |format|
      if @photo_show.update(photo_show_params)
        format.html { redirect_to @parent, notice: 'Photo show was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_shows/1
  # DELETE /photo_shows/1.json
  def destroy
    @photo_show.destroy
    respond_to do |format|
      format.html { redirect_to @parent }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_show
      @photo_show = PhotoShow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_show_params
      params.require(:photo_show).permit(:description,:data,:show_id,:user_id)
    end
end
