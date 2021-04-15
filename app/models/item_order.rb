class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefectures_id, :municipality, :house_number, :building_name, :phone_number,
                :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefectures_id, numericality: { other_than: 1, message: 'Select' }
    validates :municipality
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is out of setting range' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality,
                   house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
