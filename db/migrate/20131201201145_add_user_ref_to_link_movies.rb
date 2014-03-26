class AddUserRefToLinkMovies < ActiveRecord::Migration
  def change
    add_reference :link_movies, :user, index: true
  end
end
