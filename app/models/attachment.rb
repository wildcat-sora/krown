class Attachment < ApplicationRecord
  belongs_to :knowledge
  mount_uploader :image, ImageUploader

  def public_path
    @public_path ||= "public".freeze
  end

  #ファイルサイズを取得する
  def get_file_size
    stat = File.stat(File.join(public_path,self.image.url))
    stat.size
  end

  #ファイル名を取得する
  def get_name
    File.basename(File.join(public_path,self.image.url))
  end

  #イメージファイルの大きさを取得する
  def get_image_size
    image_size = FastImage.size(File.join(public_path,self.image.url))
  end

  #イメージファイルのタイプを取得する
  def get_type
    image_size = FastImage.type(File.join(public_path,self.image.url))
  end

end
