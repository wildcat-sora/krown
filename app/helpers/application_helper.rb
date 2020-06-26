module ApplicationHelper

  #連続した改行コードの場合、エスケープされるため明示的に改行タグを挿入する
  def br(str)
    str.gsub(/\r\n|\r|\n/, "<br>").html_safe
  end

  #データベース入力されているスペースは明示的に置換する
  def gsub_space(str)
    str.gsub(" ", "&nbsp").html_safe
  end

end
