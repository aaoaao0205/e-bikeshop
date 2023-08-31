class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image  

  validates :image, presence: true
  validates :product_name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true
end
