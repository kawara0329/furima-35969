class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, except: [:index]
  def index
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(item_params)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:content, :image, :name, :detail, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :delivery_day_id, :price, :user,).merge(user_id: current_user.id)
  end
end
