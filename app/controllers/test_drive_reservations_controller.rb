class TestDriveReservationsController < ApplicationController
  before_action :load_item, only: [:new, :create]

  def new
    @items = Item.all 
    @test_drive_reservation = TestDriveReservation.new
  end

  def create
    if @item
      @test_drive_reservation = @item.test_drive_reservations.build(test_drive_reservation_params)
      if @test_drive_reservation.save
        flash[:success] = "試乗予約が完了しました。"
        redirect_to root_path
      else
        render :new
      end
    else
      flash[:error] = "商品が見つかりませんでした。"
      redirect_to root_path
    end
  end

  private

  def load_item
    @item = params[:item_id] ? Item.find(params[:item_id]) : nil
  end

  def test_drive_reservation_params
    params.require(:test_drive_reservation).permit(:name, :email, :phone, :desired_product, :desired_date, :desired_time)
  end
end
