class AddUserRefToLinkShows < ActiveRecord::Migration
  def change
    add_reference :link_shows, :user, index: true
  end
end
