class LogBase
# 機能概要：
# ログファイル出力基盤クラス
# 1)パラメータセット
# 2)ログファイルオープン
# 3)ロギング
# 4)ファイルクローズ
#
# 文言やパラメータセットは別モジュールをincludeすること
# file_name:  出力ファイル名
# out_put:    出力する内容

  #初期化
  def initialize(file_name: "test", out_put: nil )

    #パラメータ値設定
    _file_path = set_params({   file_name: file_name,
                                out_put:   out_put
                            })

    #ログファイル書き出し
      logging(_file_path)

  end

  private

  def set_params(file_name: nil, out_put: nil)
    # ファイル名が存在する場合は指定場所へ保管する
    file_name = 'noname' unless file_name
    out_put = check_output(out_put)
    time_stamp = Time.zone.now.strftime('%Y%m%d')
    log_path = Rails.root.join('./log/batch/')

    params = {
        file_path: log_path.join("#{file_name}_#{time_stamp}.log") ,
        out_put:  out_put
    }
  end

  def check_output(out_put)
    out_put = (Time.zone.now).to_s unless out_put
    out_put + "\n" unless out_put.last.include?("\n")
  end

  def logging(params)
    puts "logging: #{params[:out_put]}"
    # ファイルクローズまで実行
    File.open(params[:file_path],"a+"){ |file| file.write(params[:out_put]) }
  end

end



# パレット
#require './app/lib/batch/test_exec.rb'
#
# メモ：
# 数字はシンボルとして扱えない。だから{1: "a"}は出来ない。{1 => "a"}

# syntax error, unexpected end-of-input, expecting keyword_end
# これは上記
# 引数でハッシュを渡している場合は注意。引数をstring定義
