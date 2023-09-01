class AddUserIdToTestDriveReservations < ActiveRecord::Migration[7.0]
  def change
    add_reference :test_drive_reservations, :user, null: false, foreign_key: true
  end
end
