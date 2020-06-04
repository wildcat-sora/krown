
# 初期化ファイル読み込みを設定していないため、明示的にロードを実施する
require Rails.root.join('app/lib/batch/base.rb')

# base親クラスを継承
class TestExec < Base

  def initialize(params)
    p "hello"
    # 共通箇所は親クラス実行により、設定。その他をオーバーライドする
    super
    execute
  end

  #p "class_"

  #test_print

  # プライベートクラスにさせる
  #private

  def execute
    output_params
  end


  def test_print
    #p "method1"
    # attr_accessorにより変数を取得する
    p "ID：　#{dealing_history_id}"
    p "アクティブ開始時刻：　#{active_start_at}"
  end

end
# 実行部位は別ファイルにする
params = {
    dealing_history_id: 1,
    active_start_at: Time.now,
    active_end_at: Time.now + 1
    }

service = TestExec.new(params)
service.test_print
service.execute
