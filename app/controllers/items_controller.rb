class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item,only: [:show, :edit,:update]
  before_action :moves_to_index, only: [:edit]

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
    
  end

  def edit
    
  end


  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end











  private

  def item_params
    params.require(:item).permit(:name,:content,:category_id,:state_id,:shipping_id,:area_id,:scheduled_day_id,:price,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

 

  def moves_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end






end
