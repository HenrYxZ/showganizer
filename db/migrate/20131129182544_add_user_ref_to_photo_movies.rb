class AddUserRefToPhotoMovies < ActiveRecord::Migration
  def change
    add_reference :photo_movies, :user, index: true
  end
end
