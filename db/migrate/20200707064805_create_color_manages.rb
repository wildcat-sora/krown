class CreateColorManages < ActiveRecord::Migration[5.2]
  def change
    create_table :color_manages do |t|
      t.references :knowledge, foreign_key: true
      t.string          :color_type
      t.string          :color_flg
      t.string          :color_1
      t.string          :color_2
      t.string          :yobi_1
      t.string          :yobi_2
      t.timestamps
    end
  end
end
