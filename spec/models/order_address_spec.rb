require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe 'order_address validates/商品購入' do
    context '@order_address.save/成功' do
      it 'token, postal_code, prefecture_id, city, house_number, phone_number が存在すれば登録できる' do
        expect(@order_address).to be_valid
      end

      it 'building_name がなくても登録できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '@order_address.save/失敗' do
      it 'tokenが空だと登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('クレジットカード情報が不正です')
      end
      it 'postal_codeが空だと登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号を入力してください')
      end
      it 'prefecture_idが空だと登録できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('都道府県を選択してください')
      end
      it 'cityが空だと登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('市区町村を入力してください')
      end
      it 'house_numberが空だと登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('番地を入力してください')
      end
      it 'phone_numberが空だと登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号を入力してください')
      end
      it 'user_idが空だと登録できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Userを入力してください')
      end
      it 'item_idが空だと登録できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Itemを入力してください')
      end
      it 'prefecture_idが0だと登録できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('都道府県を選択してください')
      end      
      it 'postal_codeが「000-0000」の形式でなければ登録できない' do
        @order_address.postal_code = '1001234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号が不正です')
      end
      it 'phone_numberが半角数字以外を含むと登録できない' do
        @order_address.phone_number = '０１２３４５６７８９'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は半角数字で入力してください')
      end
      it 'phone_numberが10桁または11桁でなければ登録できない' do
        @order_address.phone_number = '090123456780'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は10桁または11桁で入力してください')
      end
    end
  end
end
