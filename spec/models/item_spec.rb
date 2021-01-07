require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/camera.png')
    # p @item
  end

  describe 'item validates/商品出品' do
    context '@item.save/成功' do
      it "image product_name description category condition contribution shipping_area days_to_shipが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context 'imageが空だと登録できない' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('出品画像を選択してください')
      end
      it 'product_nameが空だと登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it 'descriptionが空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end
      it 'categoryが空だと登録できない' do
        @item.category = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it 'conditionが空だと登録できない' do
        @item.condition = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end
      it 'contributionが空だと登録できない' do
        @item.contribution = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it 'shipping_areaが空だと登録できない' do
        @item.shipping_area = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end
      it 'days_to_shipが空だと登録できない' do
        @item.days_to_ship = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end
      it 'selling_priceが空だと登録できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格を入力してください')
      end
      it 'selling_priceが300未満であれば登録できない' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は¥300~¥9,999,999の整数で入力してください')
      end
      it 'selling_priceが10,000,000以上であれば登録できない' do
        @item.selling_price = 10000000
        @item.selling_price = @item.selling_price
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は¥300~¥9,999,999の整数で入力してください')
      end
      it 'selling_priceに半角数値以外があれば登録できない' do
        @item.selling_price = '1a#'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は¥300~¥9,999,999の整数で入力してください')
      end
    end
  end
end
