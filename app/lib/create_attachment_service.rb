# イメージデータ作成サービス

class CreateAttachmentService

  def initialize
  end

  def attachment_data_create(image_data)
    attachment = Attachment.new()

    # イメージpath挿入
    attachment.image = image_data
    #イメージファイルのファイル名
    attachment.name = attachment.get_name
    #ファイルのタイプを取得する
    attachment.file_type = attachment.get_type

    #イメージファイルのサブid（【仮】現時点では添付ファイルは１枚のみで運用-固定）
    attachment.sub_id = 1
    # ファイルサイズ挿入
    attachment.file_size = attachment.get_file_size
    #それぞれファイルのurlを設定しておく(意味がないため、廃止。一旦コメントアウト)
    #attachment.image_url = image_data.url
    #attachment.thumb_image_url = image_data.thumb.url

    #各イメージファイルの大きさを取得
    if attachment.get_image_size
      attachment.width_size = attachment.get_image_size[0]
      attachment.height_size = attachment.get_image_size[1]
    end

    attachment
  end

end