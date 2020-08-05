class AddRemarkColumnToKnowledges < ActiveRecord::Migration[5.2]
  def change
    add_column :knowledges, :remark_flg, :string
  end
end
