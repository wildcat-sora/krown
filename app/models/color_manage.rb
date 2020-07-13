class ColorManage < ApplicationRecord

  enum color_type: { single: "single", double: "double", graphic: "graphic" }
  belongs_to  :knowledge
end
