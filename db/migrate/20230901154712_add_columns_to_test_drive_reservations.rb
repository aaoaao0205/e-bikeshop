class AddColumnsToTestDriveReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :test_drive_reservations, :phone, :string
    add_column :test_drive_reservations, :desired_product, :string
    add_column :test_drive_reservations, :desired_date, :date
    add_column :test_drive_reservations, :desired_time, :string
  end
end
