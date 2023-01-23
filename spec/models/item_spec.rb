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
        it 'category_idが空だと出品できない' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category is not a number")
        end
        it 'state_idが空だと出品できない' do
          @item.state_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("State is not a number")
        end
        it 'shipping_idが空だと出品できない' do
          @item.shipping_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping is not a number")
        end
        it 'area_idが空だと出品できない' do
          @item.area_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Area is not a number")
        end
        it 'scheduled_day_idが空だと出品できない' do
          @item.scheduled_day_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled day is not a number")
        end
        it 'priceが空だと出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが300~9999999に当てはまらないと出品できない' do
          @item.price = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
          
        end
      end
  end
end