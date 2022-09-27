require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end


  describe '購入できるとき' do
    context '購入できるとき' do
      it 'すべてのフォームの入力がされている' do
        expect(@order_address).to be_valid
      end
      it "建物名が空の場合でも保存できる" do
        @order_address.building = ''
        @order_address.valid?
        expect(@order_address).to be_valid
      end
      it "tokenがあれば保存ができる" do
        expect(@order_address).to be_valid
      end
    end

    context '商品を購入できないとき' do
      it 'post_code が空では登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_code が半角のハイフンを含んでいないと保存できない' do
        @order_address.post_code = '123ー4567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'area_idが 1 では保存できない' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area must be other than 1")
      end
      it 'cityが空では保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では保存できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが英数混合では保存できない' do
        @order_address.phone_number = '１２３４５６７８aaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is not a number")
      end
      it 'phone_numberが11桁以内の数値のみでなければ保存できない' do
        @order_address.phone_number = '１２３４５６７８９００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is not a number")
      end
      it "user_idが空では登録できない" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できない" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it "token が空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end