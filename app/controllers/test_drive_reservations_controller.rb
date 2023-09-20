class TestDriveReservationsController < ApplicationController
  before_action :load_item, only: [:new, :create]

  def new
    @items = Item.all
    @test_drive_reservation = TestDriveReservation.new
  end

  def create
    @test_drive_reservation = TestDriveReservation.new(test_drive_reservation_params)
    @test_drive_reservation.desired_time = params[:desired_time]
    @items = Item.all

    if @test_drive_reservation.save
      redirect_to root_path, notice: '保存に成功しました' 
    else
      render :new, alert: '保存に失敗しました'
    end
  end

  private
  
  def load_item
    @item = params[:item_id] ? Item.find_by(id: params[:item_id]) : nil
  end

  def test_drive_reservation_params
    params.require(:test_drive_reservation).permit(:name, :email, :phone, :desired_product, :desired_date, :desired_time)
  end
end

