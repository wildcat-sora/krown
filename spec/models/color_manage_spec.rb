require 'rails_helper'

RSpec.describe ColorManage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe '#validation' do
    #カラー管理モデルを検証する。テストデータ作成
    let(:color_manage){ create(:color_manage,
                               knowledge_id: knowledge.id )}

    let(:user){ create(:user,encrypted_password: "999999") }
    let(:genre){ create(:genre,user_id: user.id) }
    let(:knowledge){ create(:knowledge, id: 1, user_id: user.id,genre_id: genre.id)}

    context '正常系テスト' do
      it 'is valid true' do
        expect(color_manage.valid?).to be_truthy
      end
    end

    #指定のバリデーションのため、バリデーションエラーメッセージと比較する
    context '異常系:基本バリデーション' do
      it 'color_typeがnilのため、false' do
        color_manage[:color_type] = ""
        color_manage.valid?
        expect(color_manage.errors.full_messages).to eq ["Color type カラーを指定した場合は必須です"]
      end

      it 'color_1がnilのため、false' do
        color_manage[:color_1] = ""
        color_manage.valid?
        expect(color_manage.errors.full_messages).to eq ["Color 1 カラー指定の場合はカラー(1)が必須です"]
      end

      it 'color_2がnilのため、false' do
        color_manage[:color_type] = "double"
        color_manage[:color_2] = ""
        color_manage.valid?
        expect(color_manage.errors.full_messages).to eq ["Color 2 複数カラー指定の場合はカラー(2)が必須です"]
      end

      it 'group_wordが3文字以上のため、false' do
        color_manage[:group_word] = "TEST"
        color_manage.valid?
        expect(color_manage.errors.full_messages).to eq ["Group word 最大3文字までです"]
      end

      it 'group_wordを指定するとword_colorは必須のため、false' do
        color_manage[:group_word] = "RUB"
        color_manage[:word_color] = ""
        color_manage.valid?
        expect(color_manage.errors.full_messages).to eq ["Word color ワードを指定した場合はワードカラーが必須です"]
      end
    end

    context '異常系:カスタムバリデーション' do
      it 'single-color選択の場合はcolor2が不要のため、false' do
        color_manage[:color_2] = "blue"
        color_manage.valid?
        expect(color_manage.errors.full_messages).to eq ["Color type シングルカラー指定の場合はカラー2は反映されません"]
      end

      it 'color(1) プルダウンの指定以外を選択、false' do
        color_manage[:color_1] = "darkgrey"
        color_manage.valid?
        expect(color_manage.errors.full_messages).to eq ["Color 1 入力可能なカラーはドロップダウン項目のみです"]
      end

      it 'color(2) プルダウンの指定以外を選択、false' do
        color_manage[:color_type] = "double"
        color_manage[:color_2] = "darkgrey"
        color_manage.valid?
        expect(color_manage.errors.full_messages).to eq ["Color 2 入力可能なカラーはドロップダウン項目のみです"]
      end

      it '複数カラーを選択した場合、同じ色を選択しているとfalse' do
        color_manage[:color_type] = "graphic"
        color_manage[:color_1] = "red"
        color_manage[:color_2] = "red"
        color_manage.valid?
        expect(color_manage.errors.full_messages).to eq ["Color 2 複数のカラーを指定する場合は別々のカラーを指定してください。"]
      end

      it 'カラーフラグが設定されていない場合はfalse' do
        color_manage[:color_flg] = "0"
        color_manage.valid?
        expect(color_manage.errors.full_messages).to eq ["Color flg カラーフラグが設定されていない場合はカラー設定が無効になります"]
      end

    end
  end
end
