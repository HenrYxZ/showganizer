class AddAttachmentDataToPhotoEpisodes < ActiveRecord::Migration
  def self.up
    change_table :photo_episodes do |t|
      t.attachment :data
    end
  end

  def self.down
    drop_attached_file :photo_episodes, :data
  end
end
