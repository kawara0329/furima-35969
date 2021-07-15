require 'rails_helper'
RSpec.describe PurchaseShipping, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    sleep 0.5
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: @user.id, item_id: @item.id)
  end

describe '商品購入機能' do
  context '購入ができる時' do
    it 'カード情報、有効期限、セキュリティコード、郵便番号、都道府県、市区町村、番地、電話番号が存在すれば登録できる' do
      expect(@purchase_shipping).to be_valid
    end
    it '建物名が入力されていなくても購入ができる' do
      @purchase_shipping.building = ''
      expect(@purchase_shipping).to be_valid
    end
  end
  context '商品購入ができない時' do
    it 'トークンが空では登録できない' do
      @purchase_shipping.token = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空では登録できない' do
      @purchase_shipping.postal_code = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Postal code can't be blank")
    end
    it '都道府県が空では登録できない' do
      @purchase_shipping.prefecture_id = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が空では登録できない' do
      @purchase_shipping.municipality = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Municipality can't be blank")
    end
    it '番地が空では登録できない' do
      @purchase_shipping.address = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空では登録できない' do
      @purchase_shipping.tel = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Tel can't be blank")
    end
    it 'user_idが空では登録できない' do
      @purchase_shipping.user_id = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空では登録できない' do
      @purchase_shipping.item_id = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
    end
    it 'tokenが空では登録できない' do
      @purchase_shipping.token = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
    end
    it '電話番号が10桁以上11桁以内の半角数値でなければ登録できない' do
      @purchase_shipping.tel = '090-1111-1111'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Tel Tel can't be blank")
    end
    it '郵便番号は、「3桁ハイフン4桁」の半角文字列でなければ登録できない' do
      @purchase_shipping.postal_code = '1112222'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '都道府県名が未選択 (--)の場合登録できない' do
      @purchase_shipping.prefecture_id = 1
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it '郵便番号がハイフン無しでは登録できない' do
      @purchase_shipping.postal_code = '1112222'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '電話番号は英数混合では登録できない' do
      @purchase_shipping.tel = 'a0901111111'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Tel Tel can't be blank")
    end

  end
 end
end