class MakeDefaultDataService
  require('yaml')
  include ApplicationHelper

  def initialize(mode:)
    case mode
    when "new_data" then
      make_default_data
    else
    end

  end

  def make_default_data
    ActiveRecord::Base.transaction do

      ## ユーザ未登録でも同アプリが使用出来るようにデフォルトユーザを作成する
      insert_user_data()

      ## ユーザ未登録でも同アプリが使用出来るようにデフォルトユーザを作成する
      insert_genre_data()

      ##
      insert_krown_data()

    end

  end

  def insert_user_data
    begin
      default_user = User.new
      insert_data = YAML.load_file('app/lib/yaml/default_user.yml')
      insert_data.each do | data |
        default_user.id = data["id"]
        default_user.password = data["password"]
        default_user.name = data["name"]
        default_user.email = data["email"]
      end

      default_user.save
    rescue
      p "（ユーザ）データ登録に失敗しました。"
    end
  end
  def insert_genre_data
    begin
      default_genre = Genre.new
      insert_data = YAML.load_file('app/lib/yaml/default_genre.yml')
      insert_data.each do | data |
        default_genre.id = data["id"]
        default_genre.user_id = data["user_id"]
        default_genre.in_genre = data["in_genre"]
      end

      default_genre.save
    rescue
      p "（ジャンル）データ登録に失敗しました。"
    end
  end

  def insert_krown_data

    insert_data = YAML.load_file('app/lib/yaml/default_krown.yml')
    p insert_data
    insert_data.each do | data |
      begin
        default_krown = Knowledge.new
        default_krown.id = data["id"]
        default_krown.user_id = data["user_id"]
        default_krown.genre_id = data["genre_id"]
        default_krown.title = data["title"]
        p data["content"]
        default_krown.content = br(data["content"])

        if default_krown.save
          "（ノウハウ）データID：#{default_krown.id}を登録しました。"
        else
          "（ノウハウ）データID：#{default_krown.id}の登録に失敗しました。"
        end

      rescue
        next
      end
    end

  end

end