class ChangeDataAttachment < ActiveRecord::Migration[5.2]
  def change
    rename_column :attachments, :thumb_image, :thumb_image_url
    add_column :attachments, :image_url, :text
  end
end
