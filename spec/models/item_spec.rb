require 'rails_helper'

RSpec.describe Item, type: :model do
  subject(:item) { FactoryBot.build(:item) }

  describe '商品出品' do
    context '全ての項目が存在する場合' do
      it '出品できる' do
        expect(item).to be_valid
      end
    end

    context '商品画像がない場合' do
      it '出品できない' do
        item.image = nil
        expect(item).to be_invalid
      end
    end

    context '商品名がない場合' do
      it '出品できない' do
        item.name = nil
        expect(item).to be_invalid
      end
    end

    context '商品の説明がない場合' do
      it '出品できない' do
        item.description = nil
        expect(item).to be_invalid
      end
    end

    context 'カテゴリーが選択されていない場合' do
      it '出品できない' do
        item.category_id = 1
        expect(item).to be_invalid
      end
    end

    context '商品の状態が選択されていない場合' do
      it '出品できない' do
        item.condition_id = nil
        expect(item).to be_invalid
      end
    end

    context '配送料の負担が選択されていない場合' do
      it '出品できない' do
        item.shipping_fee_status_id = nil
        expect(item).to be_invalid
      end
    end

    context '発送元の地域が選択されていない場合' do
      it '出品できない' do
        item.prefecture_id = nil
        expect(item).to be_invalid
      end
    end

    context '発送までの日数が選択されていない場合' do
      it '出品できない' do
        item.shipping_day_id = nil
        expect(item).to be_invalid
      end
    end

    context '価格がない場合' do
      it '出品できない' do
        item.price = nil
        expect(item).to be_invalid
      end
    end

    context '価格が範囲外の場合（下限値）' do
      it '出品できない' do
        item.price = 299
        expect(item).to be_invalid
      end
    end

    context '価格が範囲外の場合（上限値）' do
      it '出品できない' do
        item.price = 10_000_000
        expect(item).to be_invalid
      end
    end

    context '価格が半角数字以外の場合' do
      it '出品できない' do
        item.price = '５０'
        expect(item).to be_invalid
      end
    end

    context '全ての項目が存在しない場合' do
      it '出品できない' do
        item.image = nil
        item.name = nil
        item.description = nil
        item.category_id = nil
        item.condition_id = nil
        item.shipping_fee_status_id = nil
        item.prefecture_id = nil
        item.shipping_day_id = nil
        item.price = nil

        expect(item).to be_invalid
      end
    end
  end
end

