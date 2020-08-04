class RenameRemarkColumnToKnowledges < ActiveRecord::Migration[5.2]
  def change
    remove_column :knowledges, :remark
    add_column :knowledges, :remark, :text
  end
end
