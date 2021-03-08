require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context '新規登録できるとき' do
      it '全ての情報が入力できていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it '店舗名が空欄' do
        @user.shop_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Shop name can't be blank")
      end

      it '代表者氏名が空欄' do
        @user.owner_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Owner name can't be blank")
      end
      it '代表者電話番号が空欄' do
        @user.owner_phone_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Owner phone number can't be blank")
      end

      it '代表者電話番号が数字のみでないと登録できない' do
        @user.owner_phone_number = 'a1234567890'
        @user.valid?
        expect(@user.errors.full_messages).to include("Owner phone number is invalid")
      end

      it 'phone_numberにハイフンがあると購入できない' do
        @user.owner_phone_number = '123-4567-89'
        @user.valid?
        expect(@user.errors.full_messages).to include('Owner phone number is invalid')
      end

      it '店舗住所が空欄' do
        @user.shop_address = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Shop address can't be blank")
      end
      it '店舗市町村が空欄' do
        @user.shop_city = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Shop city can't be blank")
      end
      it 'メールアドレスが空欄' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字未満だと登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordがアルファベットだけでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'ＡＢＣ１２３'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

    end

  end
end

