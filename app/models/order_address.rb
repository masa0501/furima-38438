class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :address, :city, :building, :phone_number, :order, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true },format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, area_id: area_id, city: city, address: address, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end
