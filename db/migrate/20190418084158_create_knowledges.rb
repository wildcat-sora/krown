class CreateKnowledges < ActiveRecord::Migration[5.2]
  def change
      create_table :knowledges do |t|
        t.references :user, foreign_key: true
        t.references :genre, foreign_key: true
        t.string     :title
        t.text       :content
        t.string     :keyword_1
        t.string     :keyword_2
        t.string     :yobi_1
        t.string     :yobi_2
        t.string     :yobi_3
        t.string     :yobi_4
        t.string     :yobi_5
        t.string     :src_flg
        t.string     :img_flg
        t.timestamps
    end
  end
end
