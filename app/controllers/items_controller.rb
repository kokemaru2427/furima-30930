class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :move_to_index_item]
  before_action :move_to_index_item, only: :edit 
  
  
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(product_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update  
    if @item.update(product_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id
    item.destroy
    redirect_to root_path
    else
      render :show
    end
  end



  private

  def product_params
    params.require(:item).permit(:name, :explanation, :category_id, :state_id, :shipping_charge_id, :prefecture_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index_item
    if current_user.id != @item.user_id or @item.purchase.present?
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
