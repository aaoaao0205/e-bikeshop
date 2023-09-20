class CreateTestDriveReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :test_drive_reservations do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :desired_product
      t.date :desired_date
      t.string :desired_time

      t.timestamps
    end
  end
end
