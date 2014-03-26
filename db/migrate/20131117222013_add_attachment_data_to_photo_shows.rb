class AddAttachmentDataToPhotoShows < ActiveRecord::Migration
  def self.up
    change_table :photo_shows do |t|
      t.attachment :data
    end
  end

  def self.down
    drop_attached_file :photo_shows, :data
  end
end
