module KrownsHelper

  # ページに表示されるリストの元データを取得。
  # ページネーションオブジェクトを含める
  def search_knowledge_data(page: nil)
    # データ表示上限を100件とする
    tmp_data = Knowledge.order(created_at: :desc,id: :desc).includes(:color_manages,:user,:attachments).limit(100)
    data = tmp_data.page(page).per(25)

    data
  end

  def search_result_knowledge_data(keywords: nil, page: nil)
    data = search_result(keywords: keywords).page(page).per(25)

    data
  end

  def search_result(keywords: nil)
    unless keywords.present?
      tmp_data = Knowledge.where('title LIKE(?) OR content LIKE(?)' ,"%#{keywords}%","%#{keywords}%").includes(:color_manages,:user,:attachments).order(created_at: :desc,id: :desc)
    end
    #検索結果の初期化
    key_count = 0

    data = []
    #入力されたキーワードに複数キーワードがある場合は分割検索する
    keywords.split(" ").each do |keyword|
      # 初回のみ検索
      if key_count == 0
        data = Knowledge.where('title LIKE(?) OR content LIKE(?)' ,"%#{keyword}%","%#{keyword}%").includes(:color_manages,:user,:attachments).order(created_at: :desc,id: :desc)
        key_count += 1
        next
      end

      # 1回目の検索を元に、2回目の文字からさらに絞り込みを行う。
      if key_count != 0 && data.count != 0
        data = data.where('title LIKE(?) OR content LIKE(?)' ,"%#{keyword}%","%#{keyword}%").includes(:color_manages,:user,:attachments).order(created_at: :desc,id: :desc)
        key_count += 1
        next
      end

      # 検索結果がない場合はbreakする
      break unless data.present?
    end

    tmp_data = data
  end

  def get_color_attribute(knowledge)
    color_attributes = Array.new
    knowledge.color_manages.each do | color_manage_record |

      if color_manage_record[:color_flg] == "1"
        case color_manage_record[:color_type]

        when ColorManage.color_types[:single] then
          # カラーグループ：singleを選択した場合
          # シングルカラー表示＋半透明：80%
          color_attributes = "background-color:#{color_manage_record[:color_1]};opacity: 0.8;"
          font_color_add_attribute(color_attributes,color_manage_record[:word_color])

        when ColorManage.color_types[:double] then
          # カラーグループ：doubleを選択した場合
          # ダブルカラー表示（斜め線）＋半透明：70%
          color_attributes = "background: linear-gradient(22deg, #{color_manage_record[:color_1]} 50%, #{color_manage_record[:color_2]} 50%);opacity: 0.7;"
          font_color_add_attribute(color_attributes,color_manage_record[:word_color])

        when ColorManage.color_types[:graphic] then
          # カラーグループ：graphicを選択した場合
          # グラフィック表示＋半透明：50%
          color_attributes = "background: linear-gradient(#{color_manage_record[:color_1]}, #{color_manage_record[:color_2]}); opacity: 0.5;"
          font_color_add_attribute(color_attributes,color_manage_record[:word_color])

        end
      end
    end

    color_attributes << "border-radius: 7px;"
  end

  def get_color_keyword(knowledge)
    color_attributes = ""
    knowledge.color_manages.each do | color_manage_record |
      if color_manage_record[:color_flg] == "1"
        color_attributes = color_manage_record[:group_word]
      end
    end

    color_attributes
  end

  def font_color_add_attribute(target_record,word_color)
    if word_color
      target_record << "color:#{word_color};"
    end
  end

end
