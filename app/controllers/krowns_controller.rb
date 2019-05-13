class KrownsController < ApplicationController
  #ユーザが所有しているジャンルの抽出
  before_action :select_genre, only: [:edit, :new, :index, :show]
  #ナレッジ採番用
  before_action :get_max_id, only: [:edit, :new, :index, :show]
  #カウンター
  before_action :get_count

  def index
    # 最新ナレッジを10件最新
    @knowledges = Knowledge.page(params[:page]).per(12).order("created_at DESC")
    # 最新ナレッジのみを取得
    @setsql = Knowledge.order("created_at DESC").limit(1)
    @knowledge = @setsql[0]
  end

  def show
     @knowledges = Knowledge.page(params[:page]).per(12).order("created_at DESC")
     @knowledge = Knowledge.find(get_knowledge)
     @destroy_flg = true
  end

  def new
    @knowledge = Knowledge.new
  end

  def create
    @knowledge = Knowledge.new(params_knowledge)
    if @knowledge.save!
      image_check = Knowledge.find(@knowledge.id)
      if image_check.image?
        image_check.img_flg = 1
        image_check.save
      end
      redirect_to root_path, notice: 'ナレッジを作成しました'
    else
      render :new
    end
  end

  def destroy
    krown = Knowledge.find(params[:id])
    if krown.user_id == current_user.id || krown.user_id == 99
      krown.destroy
      redirect_to root_path, notice: 'ナレッジを削除しました'
    end
  end

  def search
    # binding.pry
    # @products = Knowledge.where('title LIKE(?)', "%#{params[:keyword]}%").limit(20)
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

  def get_max_id
    @max_id = Knowledge.maximum(:id) + 1
  end

  def get_count
    if user_signed_in?
      @knowledge_count = Knowledge.where(user_id: current_user.id.to_s).count
      @genre_count = Genre.where(user_id: current_user.id.to_s).count
    else
      @knowledge_count = Knowledge.where(user_id: 99).count
      @genre_count = 0
    end
  end




end
