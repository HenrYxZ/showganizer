class RemoveAttPhotoMovies < ActiveRecord::Migration
  def change
  	remove_attachment :photo_movies, :movie_image
  end
end
