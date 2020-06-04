class GenresController < ApplicationController
  #include '../../services/krown/genre.rb'

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(params_genre)
    if @genre.save!
      redirect_to root_path, notice: 'ジャンルを作成しました'
    else
      render :new
    end
  end

private
  # 編集ページ用、パラメータ取得用メソッド
  def params_genre
    params.require(:genre).permit(
      :user_id,
      :in_genre,
      :created_at,
      :updated_at
      )
  end

end
