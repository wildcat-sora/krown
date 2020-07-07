class ColorManage < ApplicationRecord
  enum color_type: { single: 0, double: 1, graphic: 2 }
  belongs_to  :knowledge
  accepts_nested_attributes_for :knowledge
end
