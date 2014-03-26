class AddAttachmentDataToPhotoSeasons < ActiveRecord::Migration
  def self.up
    change_table :photo_seasons do |t|
      t.attachment :data
    end
  end

  def self.down
    drop_attached_file :photo_seasons, :data
  end
end
