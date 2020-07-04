class KrownsController < ApplicationController
  include ApplicationHelper
  include KrownsHelper
  require 'fastimage'

  #ユーザが所有しているジャンルの抽出
  before_action :select_genre, only: [:edit, :new, :index, :show, :search, :wordsearch ]
  #カウンター
  before_action :get_count

  def index
    # アプリケーション起動時、ログオンユーザがない場合は新規作成する
    make_default_user if User.count == 0 && Genre.count == 0

    @knowledges = search_knowledge_data(page: params[:page])
    # 最新ナレッジが存在するかどうか
    set_sql = @knowledges.limit(1)
    @knowledge = set_sql[0]
  end

  def show
    # showアクションで画面表示に使用しない。
    # @knowledges = search_knowledge_data(page: params[:page])
    @knowledge = Knowledge.find(get_knowledge)
    @destroy_flg = true
  end

  def new
    @knowledge = Knowledge.new
    # 同時並行性は今回考慮しない(工数考慮)
    @knowledge.id = set_id(@knowledge)
  end

  def create
    public_path = "public".freeze

    # ナレッジを作成するためのサービスを呼び出す
    create_knowledge_service = CreateKnowledgeService.new()
    @knowledge = create_knowledge_service.knowledge_data_create(params_knowledge)


    # 添付ファイルが存在した場合は、添付レコードを生成する
    if params_knowledge[:image]
      create_attachment_service = CreateAttachmentService.new()
      @attachment = create_attachment_service.attachment_data_create(@knowledge.image)
      #親子関係を保持したままデータを保存する
      @knowledge.attachments << @attachment
    end

    if @knowledge.save
      redirect_to root_path, notice: 'ナレッジを作成しました'
    else
      render :new
    end
  end

  def destroy
    krown = Knowledge.find(params[:id])
    if krown.user_id == current_user.id || krown.user_id == 1
      krown.destroy
      redirect_to root_path, notice: 'ナレッジを削除しました'
    end
  end

  def search
     @knowledges = Knowledge.where(genre_id: params[:format]).page(params[:page]).per(10).order("created_at DESC")
     wk_knowledge = Knowledge.where(genre_id: params[:format]).order("created_at DESC").limit(1)
     @knowledge = wk_knowledge[0]
     # テンプレートの流用(index)
     render :template => 'krowns/index'
  end

  def wordsearch
    @knowledges = search_result_knowledge_data(keywords: params[:keywords], page: params[:page])
    wk_knowledge = @knowledges.order("created_at DESC").limit(1)
    @knowledge = wk_knowledge[0]
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
      :image,
      :created_at,
      :updated_at
      )
  end

  def select_genre
    if user_signed_in?
      @genres = Genre.where(user_id: current_user.id.to_s)
    end
  end

  def set_id(knowledge)
    id = Knowledge.count != 0 ? Knowledge.maximum(:id) + 1 : 1
    id
  end

  def get_count
    if user_signed_in?
      @knowledge_count = Knowledge.where(user_id: current_user.id.to_s).count
      @genre_count = Genre.where(user_id: current_user.id.to_s).count
    else
      @knowledge_count = Knowledge.where(user_id: 1).count
      @genre_count = 0
    end
  end

 def make_default_user
   if User.count == 0
     MakeDefaultDataService.new(mode: 'new_data')
   end
 end


end
