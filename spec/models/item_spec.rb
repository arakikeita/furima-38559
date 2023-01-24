require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
      context '出品できるとき' do
        it '全て入力されていると登録ができる' do 
          expect(@item).to be_valid
        end
      end

      context '出品できないとき' do
        it 'imageが空だと出品できない' do 
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")          
        end
        it 'nameが空だと出品できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'contentが空だと出品できない' do
          @item.content = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Content can't be blank")
        end
        it 'category_idが1だと出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it 'state_idが1だと出品できない' do
          @item.state_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("State can't be blank")
        end
        it 'shipping_idが1だと出品できない' do
          @item.shipping_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping can't be blank")
        end
        it 'area_idが1だと出品できない' do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Area can't be blank")
        end
        it 'scheduled_day_idが1だと出品できない' do
          @item.scheduled_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled day can't be blank")
        end
        it 'priceが空だと出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが299円以下の場合保存できない' do
          @item.price = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
          
        end
        it 'priceが10000000円以上の場合保存できない' do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
        it 'priceが全角数値の場合は保存できない' do
          @item.price = '３００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'userが紐づいていないと出品できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")

        end

      end
  end
end