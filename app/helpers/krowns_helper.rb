module KrownsHelper

  # ページに表示されるリストの元データを取得。
  # ページネーションオブジェクトを含める
  def search_knowledge_data(page: nil)
    # データ表示上限を100件とする
    tmp_data = Knowledge.order(created_at: :desc,id: :desc).includes(:color_manage,:user,:attachments).limit(100)
    data = tmp_data.page(page).per(25)

    data
  end

  def search_result_knowledge_data(keywords: nil, page: nil)
    data = search_result(keywords: keywords).page(page).per(25)

    data
  end

  def search_result(keywords: nil)

    #キーワードが何もない時の処理
    unless keywords.present?
      #tmp_data = Knowledge.where('title LIKE(?) OR content LIKE(?) OR remark LIKE(?)' ,"%#{keywords}%","%#{keywords}%","%#{keywords}%")
      #               .includes(:color_manage,:user,:attachments)
      #               .order(created_at: :desc,id: :desc)
      #search_knowledge_data
      #キーワードを入力してくださいのバリデーションをかける
    end

    #検索結果の初期化

    key_count = 0

    data = []
    #入力されたキーワードに複数キーワードがある場合は分割検索する
    keywords.split(" ").each do |keyword|
      # 初回のみ検索
      if key_count == 0
        # 1)ナレッジからキーワード検索を実施する
        # 2)カラーDBから抽出する(or条件)
        data = Knowledge.where('title LIKE(?) OR content LIKE(?) OR remark LIKE(?)' ,"%#{keyword}%","%#{keyword}%","%#{keyword}%")
                        .or(Knowledge.where(color_manage_id: ColorManage.joins(:knowledges)
                          .where('group_word LIKE(?)',"%#{keyword}%").select("id")))

        key_count += 1
        next
      end

      # 1回目の検索を元に、2回目の文字からさらに絞り込みを行う。
      if key_count != 0 && data.count != 0
        # 1)上記と同様の検索仕様
        data = data.where('title LIKE(?) OR content LIKE(?) OR remark LIKE(?)' ,"%#{keyword}%","%#{keyword}%","%#{keyword}%")
                        .or(Knowledge.where(color_manage_id: ColorManage.joins(:knowledges)
                          .where('group_word LIKE(?)',"%#{keyword}%").select("id")))

        key_count += 1
        next
      end

      # 検索結果がない場合はbreakする
      break unless data.present?
    end

    tmp_data = data.order(created_at: :desc,id: :desc)
  end

  def get_color_attribute(knowledge)
    return unless knowledge.color_manage

    color_attributes = Array.new
    color_manage_record = knowledge.color_manage

    if color_manage_record[:color_flg] == "1"
      case color_manage_record[:color_type]

      when "single" then
        # カラーグループ：singleを選択した場合
        # シングルカラー表示＋半透明：80%
        color_attributes = "background-color:#{color_manage_record[:color_1]};opacity: 0.8;"
        font_color_add_attribute(color_attributes,color_manage_record[:word_color])

      when "double" then
        # カラーグループ：doubleを選択した場合
        # ダブルカラー表示（斜め線）＋半透明：70%
        color_attributes = "background: linear-gradient(22deg, #{color_manage_record[:color_1]} 50%, #{color_manage_record[:color_2]} 50%);opacity: 0.7;"
        font_color_add_attribute(color_attributes,color_manage_record[:word_color])

      when "graphic" then
        # カラーグループ：graphicを選択した場合
        # グラフィック表示＋半透明：50%
        color_attributes = "background: linear-gradient(#{color_manage_record[:color_1]}, #{color_manage_record[:color_2]}); opacity: 0.5;"
        font_color_add_attribute(color_attributes,color_manage_record[:word_color])

      end
    end

    color_attributes << "border-radius: 7px;"
  end

  def get_color_keyword(knowledge)
    return unless knowledge.color_manage

    color_attributes = Array.new
    color_manage_record = knowledge.color_manage
    if color_manage_record[:color_flg] == "1"
      color_attributes = color_manage_record[:group_word]
    end

    color_attributes
  end

  def font_color_add_attribute(target_record,word_color)
    if word_color
      target_record << "color:#{word_color};"
    end
  end

  def knowledge_save
    knowledge_save_flg = true

    if @attachment
      #親子関係を保持したままデータを保存する
      @knowledge.attachments << @attachment
    end

    if @color_manage
      knowledge_save_flg = false unless @color_manage.save
      #保存したのち、新規カラーidを取得し、ナレッジにセットする
      @knowledge.color_manage_id = @color_manage.id
    end

    if @knowledge
      knowledge_save_flg = false unless @knowledge.save
    end

    knowledge_save_flg

  end

end
