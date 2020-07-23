FactoryBot.define do
  factory :color_manage do
    color_type { "single" }
    color_flg { "1" }
    color_1 { "red" }
    color_2 { "" } #バリデーションを考慮し、nil
    group_word { "AAA" }
    word_color { "black" }
  end
end