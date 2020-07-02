class CreateKnowledgeService

  def initialize
  end

  def knowledge_data_create(params)
    knowledge = Knowledge.new(params)
    knowledge.img_flg = 1 if params[:image]

    knowledge
  end

end