class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :municipality, :address, :building, :tel, :purchase_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :tel, format: {with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/, message: ""}
    validates :token
  end
  
  def save
    purchase = Purchase.create!(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, tel: tel, purchase_id: purchase.id)
 end
end