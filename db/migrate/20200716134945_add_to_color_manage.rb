class AddToColorManage < ActiveRecord::Migration[5.2]
  def change
    rename_column :color_manages, :yobi_1, :group_word
    rename_column :color_manages, :yobi_2, :word_color
  end
end
