class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @item = Item.order("created_at DESC")
  end


  def new 
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end       
  end

  def show
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:name,:content,:category_id,:state_id,:shipping_id,:area_id,:scheduled_day_id,:price,:image).merge(user_id: current_user.id)
  end




end
