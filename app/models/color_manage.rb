class ColorManage < ApplicationRecord

  enum color_type: { single: "single", double: "double", graphic: "graphic" }
  has_many :knowledges

  #各バリデーション
  #カラー指定の場合はカラータイプ必須
  validates :color_type, presence: { message: "カラーを指定した場合は必須です"}
  #カラー指定の場合はcolor(1)必須
  validates :color_1, presence: { message: "カラー指定の場合はカラー(1)が必須です"}
  #ダブル・グラフィックカラー指定の場合はcolor(2)必須
  validates :color_2, presence: { message: "複数カラー指定の場合はカラー(2)が必須です" }, if: :multi_color?
  #キーワードを指定した場合は３文字まで
  validates :group_word,  length: { maximum: 3,message: "最大3文字までです" }, if: :group_word?
  #ワード指定時は、ワードカラー必須
  validates :word_color,  presence: { message: "ワードを指定した場合はワードカラーが必須です" }, if: :group_word?

  #カスタムバリデータ
  # シングルカラーが選択された場合は、color1のみが反映される。color2の入力値は弾く
  validate :single_color_check
  # color_1: 入力されたカラーがプルダウンからのもののみかどうか。
  validate :color1_check
  # color_2: 入力されたカラーがプルダウンからのもののみかどうか。
  validate :color2_check, if: :multi_color?
  # 複数カラー選択時に同じカラーの場合はfalseとする
  validate :multi_color_check, if: :multi_color?
  # カラーフラグが設定されていなければレコードとして認識されない
  validate :color_flg_check

  def single?
    self.color_type == "single"
  end

  def graphic?
    self.color_type == "graphic"
  end

  def double?
    self.color_type == "double"
  end

  def multi_color?
    color_type == "double" ||  color_type == "graphic"
  end

  def group_word?
    return true unless group_word.blank?
  end

  # シングルカラーが選択された場合は、color1のみが反映される。color2の入力値は弾く
  def single_color_check
    if self.single? && color_2.presence
      errors.add(:color_type , "シングルカラー指定の場合はカラー2は反映されません")
      false
    else
      true
    end
  end

  # color_1: 入力されたカラーがプルダウンからのもののみかどうか。
  def color1_check
    color_palette = Settings.color_select[:select_box]
    unless color_palette.include?(color_1)
      errors.add(:color_1 , "入力可能なカラーはドロップダウン項目のみです")
      false
    end
  end

  # color_2: 入力されたカラーがプルダウンからのもののみかどうか。
  def color2_check
    color_palette = Settings.color_select[:select_box]
    color_palette.include?(color_2)
    unless color_palette.include?(color_2)
      errors.add(:color_2  , "入力可能なカラーはドロップダウン項目のみです")
      false
    end
  end

  # 複数カラー選択時に同じカラーの場合はfalseとする
  def multi_color_check
    if color_1 == color_2
      errors.add(:color_2  , "複数のカラーを指定する場合は別々のカラーを指定してください。")
      false
    end
  end

  # カラーフラグが設定されていなければレコードとして認識されない
  def color_flg_check
    if color_flg != "1"
      errors.add(:color_flg  , "カラーフラグが設定されていない場合はカラー設定が無効になります")
      false
    end
  end

end
