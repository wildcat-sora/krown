class AddGroupFlgColumnToColorManages < ActiveRecord::Migration[5.2]
  def change
    add_column :color_manages, :group_flg, :string
    add_column :color_manages, :parent_id, :string
  end
end
