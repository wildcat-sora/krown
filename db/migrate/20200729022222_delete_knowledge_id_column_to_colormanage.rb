class DeleteKnowledgeIdColumnToColormanage < ActiveRecord::Migration[5.2]
  def change
    remove_column :color_manages, :knowledge_id
    add_reference :knowledges, :color_manages, index: true
  end
end
