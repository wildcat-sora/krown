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

  # 画面に情報を表示するための情報をdbから取得する
  def get_display_control_info(param_control_type: '')
    proc = Proc.new do | param |
      control_record = DisplayControl.where(control_type: param)
      control_record.count != 0 ? control_record.first[:control_value] : "情報の取得に失敗しました"
    end

    unless param_control_type.empty?
      proc.call(param_control_type)
    else
      return "パラメータ未入力"
    end

  end

end
