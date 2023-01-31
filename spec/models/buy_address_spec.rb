require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
 

  describe '商品購入機能' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @buy_address = FactoryBot.build(:buy_address,  item_id: item.id, user_id: user.id)
    end

    context '購入できる時' do
      it '全て入力されていると登録ができる' do
        expect(@buy_address).to be_valid
      end
      it '建物名がなくても登録できること' do
        @buy_address.building = ''
        expect(@buy_address).to be_valid
      end
    end
  

    context '出品できない時' do
      it '郵便番号が空だと購入できない' do 
        @buy_address.post = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post can't be blank")
      end
      it '郵便番号ハイフンがないと購入できない' do 
        @buy_address.post = 111_1111
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post is invalid")
      end
      it '都道府県が1だど購入できない' do 
        @buy_address.area_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Area can't be blank")
      end
      it '市町村が空だと購入できない' do 
        @buy_address.city = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do 
        @buy_address.num = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Num can't be blank")
      end
      it '電話番号が空だと購入できない' do 
        @buy_address.telephone = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it '電話番号が９桁以下だと購入できない' do 
        @buy_address.telephone = 9999999
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone is invalid")
      end
      it '電話番号が12桁以上だと購入できない' do 
        @buy_address.telephone = 999999999999
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone is invalid")
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @buy_address.telephone = "7777777777７"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone is invalid")
      end
      it 'user_idが空だと購入できない' do 
        @buy_address.user_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do 
        @buy_address.item_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'トークンが空だと登録できない' do 
        @buy_address.token = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
