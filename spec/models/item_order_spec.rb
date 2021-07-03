require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @item_order = FactoryBot.build(:item_order, item_id: item.id, user_id: user.id)
    sleep 0.1
  end

  describe '商品購入情報の保存' do
    context '商品購入の情報が保存できる場合' do
      it 'user_id,item_id,郵便番号・都道府県・市区町村・番地・建物名・電話番号、トークンが存在すれば保存できる' do
        expect(@item_order).to be_valid
      end
      it 'user_id,item_id,郵便番号・都道府県・市区町村・番地・電話番号、トークンが存在すれば、建物名がなくても保存できる' do
        @item_order.building_name = ''
        expect(@item_order).to be_valid
      end
    end
    context '商品購入情報が保存できない場合' do
      it 'user_idが空では保存できない' do
        @item_order.user_id = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("ユーザー名を入力してください")
      end
      it 'item_idが空では保存できない' do
        @item_order.item_id = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("商品名を入力してください")
      end
      it '郵便番号がないと保存できない' do
        @item_order.postal_code = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号にはハイフンがないと保存できない' do
        @item_order.postal_code = '1234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('郵便番号は半角数字で、「三桁の数字-四桁の数字」の形で入力してください')
      end
      it '郵便番号は全角数字混合では保存できない' do
        @item_order.postal_code = '１２３-４５６７'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('郵便番号は半角数字で、「三桁の数字-四桁の数字」の形で入力してください')
      end
      it '郵便番号は英字混合では保存できない' do
        @item_order.postal_code = 'a12-3456'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('郵便番号は半角数字で、「三桁の数字-四桁の数字」の形で入力してください')
      end
      it '郵便番号のハイフンの前にある数字は3桁以外では保存できない' do
        @item_order.postal_code = '12-3456'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('郵便番号は半角数字で、「三桁の数字-四桁の数字」の形で入力してください')
      end
      it '郵便番号のハイフンの後にある数字は4桁以外では保存できない' do
        @item_order.postal_code = '123-567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('郵便番号は半角数字で、「三桁の数字-四桁の数字」の形で入力してください')
      end
      it '都道府県がないと保存できない' do
        @item_order.prefectures_id = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('都道府県名を入力してください')
      end
      it '都道府県が1の場合登録できない' do
        @item_order.prefectures_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('都道府県名を選択してください')
      end
      it '市区町村がないと保存できない' do
        @item_order.municipality = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("市町村名を入力してください")
      end
      it '番地がないと保存できない' do
        @item_order.house_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号がないと保存できない' do
        @item_order.phone_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号が9桁以下だと保存できない' do
        @item_order.phone_number = '090123456'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('電話番号は半角数字10~11桁で入力してください')
      end
      it '電話番号が12桁以上だと保存できない' do
        @item_order.phone_number = '090123456789'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('電話番号は半角数字10~11桁で入力してください')
      end
      it '電話番号は全角数字混合では保存できない' do
        @item_order.phone_number = '０９０１２３４５６７８'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('電話番号は半角数字10~11桁で入力してください')
      end
      it '電話番号は半角数字以外の文字があると保存できない' do
        @item_order.phone_number = 'a0901234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('電話番号は半角数字10~11桁で入力してください')
      end
      it 'トークンがないと保存できない' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end
