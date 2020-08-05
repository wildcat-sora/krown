class UpdateKnowledgeService

  def initialize
  end

  def update_knowledge(params:)
    knowledge = Knowledge.find(params[:id])

    params.each do |key,value|
      # カラーの誤更新防止
      if key == "color_manage_id" || value != nil
        if value != (knowledge[key.to_sym]).to_s
          knowledge.update_attributes(key.to_s => value)
        end
      end
    end
  end

end