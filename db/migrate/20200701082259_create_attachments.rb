class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.references :knowledge, foreign_key: true
      t.string     :sub_id
      t.string     :name
      t.string     :width_size
      t.string     :height_size
      t.string     :file_type
      t.string     :sub_id
      t.string     :file_size
      t.text       :image
      t.text       :thumb_image
      t.timestamps
    end
  end
end
