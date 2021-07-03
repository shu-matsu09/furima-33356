require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品情報の保存' do
    context '商品が出品できる場合' do
      it 'image,item_name,description,category_id,condtion_id,delivery_fee_id,prefectures_id,days_to_ship_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it '商品画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリーが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを入力してください')
      end
      it 'category_idが1の場合登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it '商品の状態が空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を入力してください')
      end
      it 'condition_idが1の場合登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end
      it '配送料の負担が空では登録できない' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を入力してください')
      end
      it 'delivery_fee_idが1の場合登録できない' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it '発送元の地域が空では登録できない' do
        @item.prefectures_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を入力してください')
      end
      it 'prefectures_idが1の場合登録できない' do
        @item.prefectures_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end
      it '発送までの日数が空では登録できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を入力してください')
      end
      it 'days_to_ship_idが1の場合登録できない' do
        @item.days_to_ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end
      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it '価格の範囲が、¥299以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300〜9,999,999の範囲内で入力してください')
      end
      it '価格の範囲が、¥10,000,000以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300〜9,999,999の範囲内で入力してください')
      end
      it '価格は全角数字では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it '価格は半角英字が含まれていると登録できない' do
        @item.price = '300dollers'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it '価格は半角英字だけでは登録できない' do
        @item.price = 'threehandreddollers'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
    end
  end
end
