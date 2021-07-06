class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :detail
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :delivery_day_id
    validates :image
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :delivery_day
    belongs_to :prefecture
    belongs_to :shipping_charge
    belongs_to :status

    validates :category_id, numericality: { other_than: 1 }
    validates :delivery_day_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :shipping_charge_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
end
