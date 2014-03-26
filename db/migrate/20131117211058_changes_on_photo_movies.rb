class ChangesOnPhotoMovies < ActiveRecord::Migration
  def change
  	remove_column :photo_movies, :name
  	remove_column :photo_movies, :file
  	remove_column :photo_movies, :path
  	add_attachment :photo_movies, :movie_image
  end
end
