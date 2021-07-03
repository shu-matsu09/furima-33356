class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefectures_id, :municipality, :house_number, :building_name, :phone_number,
                :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は半角数字で、「三桁の数字-四桁の数字」の形で入力してください' }
    validates :prefectures_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :municipality
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は半角数字10~11桁で入力してください' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality,
                   house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
