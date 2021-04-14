class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures, :municipality, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefectures_id, numericality: { other_than: 1, message: 'Select' }
    validates :municipality
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is out of setting range" }
  end

  def save
    order = Order.create
    Address.create(postal_code: postal_code, prefectures: prefectures, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number,order_id: order.id)
  end
end