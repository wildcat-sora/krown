class Knowledges < ActiveRecord::Migration[5.2]
  def change
    add_column :knowledges, :image, :text
    add_column :knowledges, :public_flg, :string
  end
end
