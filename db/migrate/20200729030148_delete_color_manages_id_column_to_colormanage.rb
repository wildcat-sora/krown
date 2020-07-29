class DeleteColorManagesIdColumnToColormanage < ActiveRecord::Migration[5.2]
  def change
    remove_column :knowledges, :color_manages_id
    add_reference :knowledges, :color_manage, index: true
  end
end
