class ItemsController < ApplicationController
  before_action :require_admin, only: [:new, :create, :edit]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
      @item = Item.new
  end

  def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to item_path(@item)
      else
        render :new
      end
    end

  def show
    @item = Item.find(params[:id])
  end  

  def edit
    @item = Item.find(params[:id])
  end
  
  private
  def item_params
    params.require(:item).permit(:image, :item_name, :description, :price).merge(user_id: current_user.id)
  end  

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end

  def require_admin
    redirect_to root_path, alert: 'アクセス権限がありません。' unless current_user.admin?
  end
end
