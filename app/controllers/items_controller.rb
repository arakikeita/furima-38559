class ItemsController < ApplicationController

  def index
  end


  def new 
    @item = Item.new
  end

  def create
    @item = Item.new(prototype_params)
    if @item.save
      redirect_to action :index
    else
      @item = Item.new(prototype_params)
      render :new
    end       
  end



  private

  def item_params
    params.require(:item).permit(:name,:content,:category_id,:state_id,:shipping_id, :area_id,:scheduled_day_id,:price).merge(user_id: current_id)
  end




end
