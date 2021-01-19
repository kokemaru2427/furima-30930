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

  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :prefecture_id
  validates :shipping_charge_id
  validates :shipping_date_id
  validates :state_id
  end

  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
end
