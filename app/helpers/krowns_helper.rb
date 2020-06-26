module KrownsHelper

  # ページに表示されるリストの元データを取得。
  # ページネーションオブジェクトを含める
  def search_knowledge_data(page: nil)
    # データ表示上限を100件とする
    tmp_data = Knowledge.order(created_at: :desc,id: :desc).limit(100)
    data = tmp_data.page(page).per(13)

    data
  end

  def search_result_knowledge_data(keyword: nil, page: nil)
    tmp_data = Knowledge.where('title LIKE(?) OR content LIKE(?)' ,"%#{keyword}%","%#{keyword}%").order(created_at: :desc,id: :desc)
    data = tmp_data.page(page).per(13)

    data
  end




end
