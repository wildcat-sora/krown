class Knowledge < ApplicationRecord

    belongs_to :user
    belongs_to :genre
    has_many   :attachments, dependent: :destroy
    has_many   :color_manages,  dependent: :destroy
    mount_uploader :image, ImageUploader
    accepts_nested_attributes_for :attachments
    accepts_nested_attributes_for :color_manages

    validates :id, presence: { message: "が入力されていません。"}
    validates :id, numericality: { message: "数字で入力してください。"}
    validates :title, presence: { message: "が入力されていません。"}
    validates :content, presence: { message: "が入力されていません。"}

end
