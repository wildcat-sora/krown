class RenameKeyword2ColumnToKnowledges < ActiveRecord::Migration[5.2]
  def change
    rename_column :knowledges, :keyword_1, :remark
    rename_column :knowledges, :keyword_2, :color_group_no
  end
end
