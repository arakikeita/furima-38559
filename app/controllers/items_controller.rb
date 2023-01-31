class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item,only: [:show, :edit,:update, :destroy]
  before_action :moves_to_index, only: [:edit, :destroy]

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
    if @item.buy.present?
        redirect_to root_path
    end

    
  end


  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
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
