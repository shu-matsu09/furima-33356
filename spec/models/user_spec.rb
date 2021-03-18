require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録/ユーザー情報' do
    context '新規登録できるとき' do
      it 'nicknameとemail,password,password_confrimation,名字と名前(全角の漢字・ひらがな・カタカナ)、名字と名前のフリガナ(全角のカタカナ)、生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it '@が存在しないemailでは登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方(半角)を含めて設定してください')
      end
      it 'passwordが半角英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方(半角)を含めて設定してください')
      end
      it 'passwordが全角英数混合では登録できない' do
        @user.password = 'Ａｂｃ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方(半角)を含めて設定してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = '234bcd'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end

  describe 'ユーザー新規登録/本人情報確認' do
    context '新規登録ができないとき' do
      it 'ユーザー本名の名字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'ユーザー本名の名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'ユーザー本名が全角ではないと登録できない' do
        @user.first_name = 'ｻﾄｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name には全角文字(漢字・ひらがな・カタカナ)を使用してください')
      end
      it 'ユーザー本名の名字は全角(漢字・ひらがな・カタカナ)以外は登録できない' do
        @user.last_name = 'satou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name には全角文字(漢字・ひらがな・カタカナ)を使用してください')
      end
      it 'ユーザー本名の名前は全角(漢字・ひらがな・カタカナ)以外は登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name には全角文字(漢字・ひらがな・カタカナ)を使用してください')
      end
      it 'ユーザー本名のフリガナは、名字が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'ユーザー本名のフリガナは、名前が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'ユーザー本名のフリガナは、全角ではないと登録できない' do
        @user.first_name_kana = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana には全角(カタカナ)を使用してください')
      end
      it 'ユーザー本名の名字のフリガナは、全角(カタカナ)以外は登録できない' do
        @user.last_name_kana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana には全角(カタカナ)を使用してください')
      end
      it 'ユーザー本名の名前のフリガナは、全角(カタカナ)以外は登録できない' do
        @user.first_name_kana = 'じろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana には全角(カタカナ)を使用してください')
      end
      it '生年月日が空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
