class AddItemIdToTestDriveReservations < ActiveRecord::Migration[7.0]
  def change
    add_reference :test_drive_reservations, :item, null: false, foreign_key: true
  end
end
