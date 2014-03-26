class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy,
   :seen, :unseen, :add_to_watchlist, :remove_from_watchlist, :add_trailer, :remove_trailer]
  before_action :get_parent

  def get_parent
    if params[:show_id]
      @parent = Show.find(params[:show_id])    
    end
  end

  # GET /movies
  # GET /movies.json
  def index
    if @parent
      @movies = @parent.movies
    else
      @movies = Movie.all
    end
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @reviews = Review.where(movie: @movie)
    if current_user
      @review = @movie.reviews.find_by(user_id: current_user.id)
      if current_user_is_admin?
        @photo_movies_current_user=@movie.photo_movies
      else
        @photo_movies_current_user=@movie.photo_movies.where(:user_id => current_user.id)
      end
      if not @review
        @review = Review.new
      end
      @trailer = Trailer.find_by(user: current_user,movie: @movie)
    end
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    if @parent
      @movie = @parent.movies.new(movie_params)
    else
      @movie = Movie.new(movie_params)
    end
    unless params[:movie][:photo_movies].nil?
      params[:movie][:photo_movies].each do |picture|      
        @movie.photo_movies.new(:data=> picture)
      end
    end
    respond_to do |format|
      if @movie.save
        if params[:show_id]
          format.html { redirect_to [@parent,@movie], notice: 'Movie was successfully created.' }
        else
          format.html {redirect_to @movie}
        end
        format.json { render action: 'show', status: :created, location: @movie }
      else
        format.html { render action: 'new' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    unless params[:movie][:photo_movies].nil?
      params[:movie][:photo_movies].each do |picture|      
        @movie.photo_movies.new(:data=> picture)
      end
    end
    respond_to do |format|
      if @movie.update(movie_params)
        if params[:show_id]
          format.html { redirect_to [@parent,@movie], notice: 'Movie was successfully updated.' }
        else
          format.html {redirect_to movie_psth, notice: 'Movie was successfully updated.'}
        end
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      if @parent
        format.html { redirect_to polymorphic_url(@parent) }
      else
        format.html { redirect_to movies_path}
      end
      format.json { head :no_content }
    end
  end

  # POST /movies/1

  def seen
    current_user.movies << @movie
    redirect_to [@parent, @movie], notice: 'La película fue agregada a la
    lista de vistas'
  end

  # POST /movies/1

  def unseen
    current_user.movies.delete(@movie)
    redirect_to [@parent, @movie], notice: 'Movie was removed from seen list'
  end

  # GET /movies/category/:category
  def category
    @movies = Movie.where(category: params[:category])
  end

  # GET /movies/1/add_to_watchlist
  def add_to_watchlist
    WatchlistMovie.create(user: current_user, movie: @movie)
    redirect_to [@parent, @movie], notice: 'La película fue agregada a la watchlist'
  end

  # GET /movies/1/remove_from_watchlist
  def remove_from_watchlist
    encontrado = WatchlistMovie.find_by(user:current_user, movie: @movie)
    encontrado.destroy if encontrado 
    redirect_to [@parent, @movie], notice: 'La película fue eliminada de la watchlist'
  end

  def add_trailer
    @trailer = Trailer.create(url: params[:video_url], movie: @movie, user: current_user)
    redirect_to @movie, notice: 'Trailer successfully added'
  end

  def remove_trailer
    @trailer = Trailer.find_by(movie: @movie, user: current_user)
    @trailer.destroy
    redirect_to @movie, notice: 'Trailer successfully removed'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
      if @movie.show
        @parent=@movie.show
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:name, :release_date, :description, :number, :category, :photo_movies)
    end
end
