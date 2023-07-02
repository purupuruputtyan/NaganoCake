class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  validates :customer_id, presence: true
  validates :post_code, presence: true, length: {maximum:7}
  validates :address, presence: true
  validates :name, presence: true
  
  enum payment_method: { credit_card: 0, transfer: 1 }
end
