require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'ニックネーム、メールアドレス、パスワードとパスワードの確認、苗字と苗字カナ、名前と名前カナ、生年月日が存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it '苗字が空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it '苗字カナが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it '名前が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it '名前カナが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it '生年月日が空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end
    it 'パスワードは英数字混合でなければ登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
    end
    it 'パスワードとパスワード確認は同一出なければ登録できない' do
      @user.password = 'a111111'
      @password_confirmation = 'b222222'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it '苗字は全角で入力しないと登録できない' do
      @user.last_name = 'ｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name is invalid. Input full-width characters.'
    end
    it '名前は全角で入力しないと登録できない' do
      @user.first_name = 'ｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name is invalid. Input full-width characters.'
    end
    it '苗字カナは全角カナで入力しないと登録できない' do
      @user.last_name_kana = 'ｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name kana is invalid. Input full-width katakana characters.'
    end
    it '名前カナは全角カナで入力しないと登録できない' do
      @user.first_name_kana = 'ｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana is invalid. Input full-width katakana characters.'
    end
    it 'パスワードが6文字以上でなければ登録できない' do
      @user.password = '1111'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end

    it 'メールアドレスは＠が無いと登録できない' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end
    it '重複したメールアドレスが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Email has already been taken'
    end
  end
end
