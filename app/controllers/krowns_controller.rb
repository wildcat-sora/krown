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
     @knowledge = Knowledge.find(get_knowledge)
  end

  def edit
    @knowledge = Knowledge.new
    @max_id = Knowledge.maximum(:id) + 1
  end

  def create
    @knowledge = Knowledge.new(params_knowledge)
    if @knowledge.user_id == 0
      @knowledge.user_id = 99
    end
    if @knowledge.genre_id == nil
      @knowledge.genre_id = 1
    end

    if @knowledge.save!
      redirect_to root_path, notice: 'ナレッジを作成しました'
    # else
    #   render :new
    end

  end

private

  def get_knowledge
    params.require(:id)
  end

  def params_knowledge
    params.require(:knowledge).permit(
      :id,
      :user_id,
      :title,
      :content,
      :keyword_1,
      :keyword_2,
      :yobi_1,
      :created_at,
      :updated_at
      )
  end

end
