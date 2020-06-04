require Rails.root.join('app/lib/batch/log_base.rb')

class Log < LogBase

  file_path = 'batch_test'
  out_put = "テスト出力"

  #def log_add(file_path,out_put)
  #  service = LogBase(file_path,out_put).new
  #end

end

# class定義は、ちゃんと「class/module name must be CONSTANT」ということ
# rubyバージョン2.2以上はs.freeze
# s2.frozen?　can't modify frozen String
# この場合は、「」