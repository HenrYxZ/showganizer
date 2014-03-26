class PhotoMoviesController < ApplicationController
  before_action :set_photo_movie, only: [:show, :edit, :update, :destroy]
  before_action :get_movie

  def get_movie
    @parent = Movie.find(params[:movie_id]) if params[:movie_id] 
  end
  # GET /photo_movies
  # GET /photo_movies.json
  def index
    @photo_movies = PhotoMovie.all
  end

  # GET /photo_movies/1
  # GET /photo_movies/1.json
  def show
  end

  # GET /photo_movies/new
  def new
    @photo_movie = PhotoMovie.new
  end

  # GET /photo_movies/1/edit
  def edit
  end

  # POST /photo_movies
  # POST /photo_movies.json
  def create
    @photo_movie = PhotoMovie.new(photo_movie_params)
    @photo_movie.movie=@parent
    @photo_movie.user=current_user
    respond_to do |format|
      if @photo_movie.save
        format.html { redirect_to [@parent.show,@parent], notice: 'Photo movie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo_movie }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photo_movies/1
  # PATCH/PUT /photo_movies/1.json
  def update
    respond_to do |format|
      if @photo_movie.update(photo_movie_params)
        format.html { redirect_to @photo_movie, notice: 'Photo movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_movies/1
  # DELETE /photo_movies/1.json
  def destroy
    @photo_movie.destroy
    respond_to do |format|
      format.html { redirect_to photo_movies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_movie
      @photo_movie = PhotoMovie.find(params[:id])
      if @photo_movie.movie
        @parent=@photo_movie.movie
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_movie_params
      params.require(:photo_movie).permit(:description,:data, :id, :user_id)
    end
end
