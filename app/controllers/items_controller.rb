class ItemsController < ApplicationController

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    if current_user.admin?
      @items = Item.new
    else
      redirect_to root_path, alert: "商品出品は管理者のみが許可されています。"
    end
  end

  def create
    if current_user.admin?
      @item = Item.new(item_params)
      if @item.save
        redirect_to items_path, notice: "商品を出品しました。"
      else
        render :new
      end
    else
      redirect_to root_path, alert: "商品出品は管理者のみが許可されています。"
    end
  end

  def show
    @item = Item.find(params[:id])
  end  

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :description, :price).merge(user_id: current_user.id)
  end  

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
