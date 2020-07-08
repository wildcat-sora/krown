class ColorManage < ApplicationRecord
  enum color_type: { single: "single", double: "double", graphic: "graphic" }
  belongs_to  :knowledge
  accepts_nested_attributes_for :knowledge
end
