class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private

  def message_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
