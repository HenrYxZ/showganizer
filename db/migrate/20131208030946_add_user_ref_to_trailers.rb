class AddUserRefToTrailers < ActiveRecord::Migration
  def change
    add_reference :trailers, :user, index: true
  end
end
