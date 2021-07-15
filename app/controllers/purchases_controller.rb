class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_params
  before_action :sold_out_item
  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :tel).merge(user_id:current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end

  def find_params
    @item = Item.find(params[:item_id])
  end

  def sold_out_item
    if current_user.id == @item.user.id || @item.purchase.present?
      redirect_to root_path
    end
  end
end
