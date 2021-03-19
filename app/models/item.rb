class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :predectures_id
    validates :days_to_ship_id
    validates :price, numericality: {
       only_integer: true, :greater_than_or_equal_to: 300, :less_than_or_equal_to: 9999999 
      }
  end

  belongs_to :user

end
