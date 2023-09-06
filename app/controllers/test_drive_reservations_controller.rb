class TestDriveReservationsController < ApplicationController
  def new
    if params[:item_id]
      @item = Item.find(params[:item_id])
      @test_drive_reservation = @item.test_drive_reservations.new
      @available_products = Item.pluck(:item_name)
    else
      render :new
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @test_drive_reservation = @item.test_drive_reservations.build(test_drive_reservation_params)
    if @test_drive_reservation.save
      flash[:success] = "試乗予約が完了しました。"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def test_drive_reservation_params
    params.require(:test_drive_reservation).permit(:name, :email, :phone, :desired_product, :desired_date, :desired_time)
  end
end
