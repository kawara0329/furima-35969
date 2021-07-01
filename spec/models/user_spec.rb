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
    'ニックネーム、メールアドレス、パスワードとパスワードの確認、苗字と苗字カナ、名前と名前カナ、生年月日が存在すれば登録できる'
    '苗字が空では登録できない'
    '苗字カナが空では登録できない'
    '名前が空では登録できない'
    '名前カナが空では登録できない'
    '生年月日が空では登録できない'
    'パスワードは英数字混合でなければ登録できない'
    'パスワードとパスワード確認は同一出なければ登録できない'
    '苗字は全角で入力しないと登録できない'
    '名前は全角で入力しないと登録できない'
    '苗字カナは全角カナで入力しないと登録できない'
    '名前カナは全角カナで入力しないと登録できない'
    ''
  end
end
