class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefectures_id, :municipality, :address, :building, :tel, :purchase_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefectures_id
    validates :municipality
    validates :address
    validates :tel, format: {with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/, message: ""}
    validates :purchase_id

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building: building, tel: tel,)
  end
end