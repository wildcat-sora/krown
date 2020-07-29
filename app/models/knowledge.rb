class Knowledge < ApplicationRecord

    belongs_to :user
    belongs_to :genre
    has_many   :attachments, dependent: :destroy
    belongs_to   :color_manage

    mount_uploader :image, ImageUploader
    accepts_nested_attributes_for :attachments

    validates :id, presence: { message: "が入力されていません。"}
    validates :id, numericality: { message: "数字で入力してください。"}
    validates :title, presence: { message: "が入力されていません。"}
    validates :content, presence: { message: "が入力されていません。"}

end
