class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipalities, :residence, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :municipalities
    validates :residence
    validates :phone_number, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
  end
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

  def save

    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, municipalities: municipalities, residence: residence, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end