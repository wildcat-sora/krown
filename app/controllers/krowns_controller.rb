class KrownsController < ApplicationController
  before_action :select_genre, only: [:edit, :new, :index, :show]
  before_action :get_max_id, only: [:edit, :new, :index, :show]

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

  def new
    @knowledge = Knowledge.new
  end

  def create
    @knowledge = Knowledge.new(params_knowledge)
    if @knowledge.save!
      redirect_to root_path, notice: 'ナレッジを作成しました'
    else
      render :new
    end
  end

private

  # 詳細ぺージ出力用、検索用メソッド
  def get_knowledge
    params.require(:id)
  end

  # 編集ページ用、パラメータ取得用メソッド
  def params_knowledge
    params.require(:knowledge).permit(
      :id,
      :user_id,
      :genre_id,
      :title,
      :content,
      :keyword_1,
      :keyword_2,
      :yobi_1,
      :created_at,
      :updated_at
      )
  end

  def select_genre
    if user_signed_in?
      @genres = Genre.where(user_id: current_user.id.to_s)
    end
  end

  def get_max_id
    @max_id = Knowledge.maximum(:id) + 1
  end


end
