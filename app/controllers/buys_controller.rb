class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_buy, only: [:index, :create]





  def index
    @buy_address = BuyAddress.new
    if @item.buy.present? || current_user == @item.user
      redirect_to root_path
    end
  end



  def create
    @buy_address = BuyAddress.new(buy_params)
      if  @buy_address.valid?
        pay_item
        @buy_address.save
        redirect_to root_path
      else
        render :index
      end
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] #秘密鍵を定義
    Payjp::Charge.create(
      amount: @item.price, #商品の値段
      card: buy_params[:token], #カードトークン
      currency: 'jpy' ##通貨の種類(円)
    )
  end


  private

  def buy_params
    params.require(:buy_address).permit(:post, :area_id, :city, :num, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_buy
    @item = Item.find(params[:item_id])
  end



 
end
