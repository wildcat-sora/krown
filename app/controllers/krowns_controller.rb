class KrownsController < ApplicationController


  def index
    # @knowledgebases = Knowledgebase.order("created_at DESC").page(params[:page]).per(5)
    # 最新ナレッジを10件最新
    @knowledges = Knowledge.order("created_at DESC").limit(10)
    # 最新ナレッジのみを取得
    @setsql = Knowledge.order("created_at DESC").limit(1)
    @knowledge = @setsql[0]
  end

  def show
     @knowledges = Knowledge.order("created_at DESC").limit(10)
     # @knowledge = Knowledge.find(get_knowledge)
     @knowledge = Knowledge.find(get_knowledge)
  end

  def edit
    @knowledge = Knowleges.find(params[:id])
  end


private

  def get_knowledge
    params.require(:id)
  end

end
