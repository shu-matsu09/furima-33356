class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :description
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :predectures_id
      validates :days_to_ship_id
    end
    validates :price, numericality: {
       only_integer: true, :greater_than_or_equal_to: 300, :less_than_or_equal_to: 9999999 
      }
  end

  belongs_to :user
  extend ActiveHash::Associations::ApplicationRecordExtensions
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :delivery_fee_id
  belongs_to :predectures_id
  belongs_to :days_to_ship_id
  has_one_attached :image

end
