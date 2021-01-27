class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_item, only: [:new, :create, :move_to_index_purchase]
  before_action :move_to_index_purchase, only: [:new, :create]

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render action: :new
    end
  end


  private

  def move_to_index_purchase
    if current_user.id == @item.user_id or @item.purchase.present?
        redirect_to root_path
    end
  end

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture, :municipalities, :residence, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
