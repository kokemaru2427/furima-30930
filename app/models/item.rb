class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :shipping_date
  belongs_to :state

  belongs_to :user
  has_one :purchase
  has_one_attached :image
  
  with_options presence: true do
  validates :image  
  validates :name
  validates :explanation
  end
  validates :category_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :shipping_date_id, numericality: { other_than: 1 }
  validates :state_id, numericality: { other_than: 1 }

  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }
end
