class Genre < ApplicationRecord
  belongs_to :user
  has_many  :knowledges

  # モデルを満たすバリデーションの実装については、随時行っていきます。
  # 現在はカラーを管理するモデルに対してバリデーションを実装しています。

end
