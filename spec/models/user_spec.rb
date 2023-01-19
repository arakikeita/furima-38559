require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context '登録できるとき' do
      it '全て入力されていると登録ができる' do 
        expect(@user).to be_valid
      end
      
    end
    context '登録できないとき' do
      it 'nacknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'email空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'email一意性がないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'email@がないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end 
      it 'password 6文字以下だと登録できない' do
        @user.password = 'aa222'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'password 半角英数字混合でないと登録できない' do
        @user.password = '222222'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'password 確認用と同じでないと登録できない' do
        @user.password = 'aaa222'
        @user.encrypted_password = 'aaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")  
      end

      it '全角文字を含むパスワードは登録できない' do
        @user.password = 'あaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'surnameが空だと登録できない' do
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname can't be blank")
      end
      it 'nameが空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'surname 全角漢字でないと登録できない' do
        @user.surname = 'araki'
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname 全角文字を使用してください")
      end
      it 'name 全角漢字でないと登録できない' do
        @user.name = 'keita'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name 全角文字を使用してください")
      end
      it 'surnamekが空だと登録できない' do
        @user.surnamek = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surnamek can't be blank")
      end
      it 'namekが空だと登録できない' do
        @user.namek = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Namek can't be blank")
      end
      it 'surnamek 全角カナでないと登録できない' do
        @user.surnamek = '荒木'
        @user.valid?
        expect(@user.errors.full_messages).to include("Surnamek 全角カナを使用してください")
      end
      it 'namek 全角カナでないと登録できない' do
        @user.namek = '荒木'
        @user.valid?
        expect(@user.errors.full_messages).to include("Namek 全角カナを使用してください")
      end
      it 'birthday空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end
  end
end
