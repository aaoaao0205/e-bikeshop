class TestDriveReservation < ApplicationRecord
  belongs_to :item

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :phone, presence: true
  validates :desired_product, presence: true
  validates :desired_date, presence: true
  validates :desired_time, presence: true
end
