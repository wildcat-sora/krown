module ApplicationHelper

  #連続した改行コードの場合、エスケープされるため明示的に改行タグを挿入する
  def br(str)
    str.gsub(/\r\n|\r|\n/, "<br>").html_safe
  end

  #データベース入力されているスペースは明示的に置換する
  def gsub_space(str)
    # 半角スペースを変換する
    str = str.gsub(" ", "&nbsp").html_safe
    # タブ文字を変換する
    str = str.gsub(/\t/, "&nbsp&nbsp&nbsp").html_safe

    str
  end

  # ファイルパスとファイルネームを結合して返す
  def make_path(file_path,file_name)
    File.join(file_path,file_name)
  end

  # ヘッダにバージョン情報を表示する
  def update_timing
    control_record = DisplayControl.where(control_type: 'uptiming')
    control_record.count != 0 ? control_record.first[:control_value] : "更新情報を入力してください"
  end

end
