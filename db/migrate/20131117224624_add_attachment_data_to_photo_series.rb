class AddAttachmentDataToPhotoSeries < ActiveRecord::Migration
  def self.up
    change_table :photo_series do |t|
      t.attachment :data
    end
  end

  def self.down
    drop_attached_file :photo_series, :data
  end
end
