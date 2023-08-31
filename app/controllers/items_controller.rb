class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    redirect_to '/'
  end

  private
  def item_params
    params.require(:item).permit(:image, :product_name, :description, :price).merge(user_id: admin_user.id)
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
