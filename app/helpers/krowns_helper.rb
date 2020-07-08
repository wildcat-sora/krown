module KrownsHelper

  # ページに表示されるリストの元データを取得。
  # ページネーションオブジェクトを含める
  def search_knowledge_data(page: nil)
    # データ表示上限を100件とする
    tmp_data = Knowledge.order(created_at: :desc,id: :desc).limit(100)
    data = tmp_data.page(page).per(13)

    data
  end

  def search_result_knowledge_data(keywords: nil, page: nil)
    #tmp_data = Knowledge.where('title LIKE(?) OR content LIKE(?)' ,"%#{keywords}%","%#{keywords}%").order(created_at: :desc,id: :desc)
    data = search_result(keywords: keywords).page(page).per(13)

    data
  end

  def search_result(keywords: nil)
    unless keywords.present?
      tmp_data = Knowledge.where('title LIKE(?) OR content LIKE(?)' ,"%#{keywords}%","%#{keywords}%").order(created_at: :desc,id: :desc)
    end
    #検索結果の初期化
    key_count = 0

    data = []
    #入力されたキーワードに複数キーワードがある場合は分割検索する
    keywords.split(" ").each do |keyword|
      # 初回のみ検索
      if key_count == 0
        data = Knowledge.where('title LIKE(?) OR content LIKE(?)' ,"%#{keyword}%","%#{keyword}%").order(created_at: :desc,id: :desc)
        key_count += 1
        next
      end

      # 1回目の検索を元に、2回目の文字からさらに絞り込みを行う。
      if key_count != 0 && data.count != 0
        data = data.where('title LIKE(?) OR content LIKE(?)' ,"%#{keyword}%","%#{keyword}%").order(created_at: :desc,id: :desc)
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
    knowledge.color_manage.each do | color_manage_record |

      if color_manage_record[:color_flg] == "1"
        case color_manage_record[:color_type]

        when ColorManage.color_types[:single] then
          # カラーグループ：singleを洗濯した場合
          #
          color_attributes = "background-color:#{color_manage_record[:color_1]};opacity: 0.8;"
        when ColorManage.color_types[:double] then
          color_attributes = "background: linear-gradient(22deg, #{color_manage_record[:color_1]} 50%, #{color_manage_record[:color_2]} 50%);opacity: 0.7;"
        when ColorManage.color_types[:graphic] then
          color_attributes = "background: linear-gradient(#{color_manage_record[:color_1]}, #{color_manage_record[:color_2]}); opacity: 0.5;"
        end
      end
    end

    color_attributes << "border-radius: 7px;"
  end

end
