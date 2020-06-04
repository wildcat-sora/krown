class Base

  attr_accessor(:dealing_history_id,:active_start_at,:active_end_at)

  def initialize(params)
    set_params(params)
  end

  private


  # 入力されたパラメータをインスタンス変数にセット
  def set_params(params)
    @dealing_history_id = params[:dealing_history_id] ? params[:dealing_history_id] : nil
    @active_start_at = params[:active_start_at] ? params[:active_start_at] : nil
    @active_end_at = params[:active_end_at] ? params[:active_end_at] : nil
  end

  def output_params
    p dealing_history_id

  end

end



