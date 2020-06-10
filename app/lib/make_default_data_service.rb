# 初期データ生成サービス
# パラメータ：モード
# 機能概要：パラメータに従って、フェーズに合わせたデータを生成する

class MakeDefaultDataService

  def initialize(mode:)
    case mode
      when "new_data" then
        make_default_data
      else
    end

  end

  def make_default_data
    # ユーザ未登録でも同アプリが使用出来るようにデフォルトユーザを作成する
    default_user = User.new
    default_user.update_attributes(
      id: 1,
      password: 111111,
      name: '未登録ユーザ',
      email: 'example@test.com'
    )

    # ユーザ未登録でも同アプリが使用出来るようにデフォルトユーザを作成する
    default_genre = Genre.new
    default_genre.update_attributes(
      id: 1,
      user_id:  1,
      in_genre: 'ジャンル未登録'
      )
  end

end