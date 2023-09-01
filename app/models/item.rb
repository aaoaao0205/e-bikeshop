class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image  

  validates :image, presence: true
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true
end
