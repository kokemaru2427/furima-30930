class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(product_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end



  private

  def product_params
    params.require(:item).permit(:name, :explanation, :category_id, :state_id, :shipping_charge_id, :prefecture_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  
end
