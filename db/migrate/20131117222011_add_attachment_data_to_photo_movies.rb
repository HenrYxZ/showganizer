class AddAttachmentDataToPhotoMovies < ActiveRecord::Migration
  def self.up
    change_table :photo_movies do |t|
      t.attachment :data
    end
  end

  def self.down
    drop_attached_file :photo_movies, :data
  end
end
