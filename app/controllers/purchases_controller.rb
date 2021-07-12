class PurchasesController < ApplicationController
  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params_require(:purchase_shipping).pirmit(:postal_code, :prefectures_id, :municipality, :address, :building, :tel).merge(user_id:current_user.id)
  end
end
