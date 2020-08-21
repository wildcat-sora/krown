class CreateKnowledgeService

  def initialize
  end

  def knowledge_data_create(params)
    knowledge = Knowledge.new(params)
    #イメージが添付されているときはフラグを設定しておく
    knowledge.img_flg = 1 if params[:image]
    #備考欄に入力がある場合は、備考欄フラグを設定しておく
    knowledge.remark_flg = 1 unless params[:remark].blank?
    knowledge
  end

end