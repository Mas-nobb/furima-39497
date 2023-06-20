require 'rails_helper'

RSpec.describe Item, type: :model do
  subject(:item) { FactoryBot.build(:item) }

  describe '商品出品' do
    context '出品ができる時' do
      it '全ての項目が存在すれば出品できる' do
        expect(item).to be_valid
      end
    end

    context '出品ができない時' do
      it '商品画像がないと出品できない' do
        item.image = nil
        item.valid?
        expect(item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がないと出品できない' do
        item.name = nil
        item.valid?
        expect(item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明がないと出品できない' do
        item.description = nil
        item.valid?
        expect(item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが選択されていないと出品できない' do
        item.category_id = 1
        item.valid?
        expect(item.errors.full_messages).to include("Category is reserved")
      end
      
      it '商品の状態が選択されていないと出品できない' do
        item.condition_id = 1
        item.valid?
        expect(item.errors.full_messages).to include("Condition is reserved")
      end
      
      it '配送料の負担が選択されていないと出品できない' do
        item.shipping_fee_status_id = 1
        item.valid?
        expect(item.errors.full_messages).to include("Shipping fee status is reserved")
      end
      
      it '発送元の地域が選択されていないと出品できない' do
        item.prefecture_id = 1
        item.valid?
        expect(item.errors.full_messages).to include("Prefecture is reserved")
      end
      
      it '発送までの日数が選択されていないと出品できない' do
        item.shipping_day_id = 1
        item.valid?
        expect(item.errors.full_messages).to include("Shipping day is reserved")
      end
      

      it '価格がないと出品できない' do
        item.price = nil
        item.valid?
        expect(item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が範囲外（下限値）の場合は出品できない' do
        item.price = 299
        item.valid?
        expect(item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が範囲外（上限値）の場合は出品できない' do
        item.price = 10_000_000
        item.valid?
        expect(item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '価格に半角数字以外が含まれている場合は出品できない' do
        item.price = 'abc'
        item.valid?
        expect(item.errors.full_messages).to include("Price is not a number")
      end      

      it 'ユーザーが紐付いていないと出品できない' do
        item.user = nil
        item.valid?
        expect(item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
