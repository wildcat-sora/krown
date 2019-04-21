class KrownsController < ApplicationController


  def index
    # @knowledgebases = Knowledgebase.order("created_at DESC").page(params[:page]).per(5)
    @knowledges = Knowledge.order("created_at DESC").limit(10)
  end

end
