require 'rails_helper'
  RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      it '商品名、カテゴリー、画像、商品の説明、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '商品の説明が空では登録できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Detail can't be blank"
      end
      it 'カテゴリーが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態が空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it '配送料の負担が空では登録できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping charge can't be blank"
      end
      it '配送元の地域が空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '配送までの日数が空では登録できない' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day can't be blank"
      end
      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '価格は、¥300~¥9,999,999の間のみでなければ投稿できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it '価格は半角数値のみでなければ投稿できない' do
        @item.price = 'ああ'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
       end
    end
  end