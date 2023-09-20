class TestDriveReservation < ApplicationRecord
  validates :name, :email, :phone, :desired_product, :desired_date, :desired_time, presence: true
end
