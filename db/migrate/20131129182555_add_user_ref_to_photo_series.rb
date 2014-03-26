class AddUserRefToPhotoSeries < ActiveRecord::Migration
  def change
    add_reference :photo_series, :user, index: true
  end
end
