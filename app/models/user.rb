class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many  :knowledges
  has_many  :genres

  # モデルを満たすバリデーションの実装については、随時行っていきます。
  # 現在はカラーを管理するモデルに対してバリデーションを実装しています。

end
