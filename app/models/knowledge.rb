class Knowledge < ApplicationRecord

    belongs_to :user
    belongs_to :genre
    belongs_to   :color_manage,optional: true   #カラーが指定されていないくても保存できるようにする
    has_many   :attachments, dependent: :destroy

    mount_uploader :image, ImageUploader
    accepts_nested_attributes_for :attachments
    accepts_nested_attributes_for :color_manage

    # モデルを満たすバリデーションの実装については、随時行っていきます。
    # 現在はカラーを管理するモデルに対してバリデーションを実装しています。

    validates :id, presence: { message: "が入力されていません。"}
    validates :id, numericality: { message: "数字で入力してください。"}
    validates :title, presence: { message: "が入力されていません。"}
    validates :content, presence: { message: "が入力されていません。"}

end
