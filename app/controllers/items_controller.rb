class ItemsController < ApplicationController

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    if current_user.admin?
      @item = Item.new
    else
      redirect_to root_path
    end
  end

  def create
    if current_user.admin?
      @item = Item.new(item_params)
      if @item.save
        redirect_to items_path
      else
        render :new
      end
    else
      redirect_to root_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end  

  def edit
    @item = Item.find(params[:id])
    if current_user.admin?
    else
      redirect_to root_path
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:image, :item_name, :description, :price).merge(user_id: current_user.id)
  end  

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
