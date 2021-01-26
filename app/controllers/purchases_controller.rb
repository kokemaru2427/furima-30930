class PurchasesController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render action: :new
    end
  end


  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture, :municipalities, :residence, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
