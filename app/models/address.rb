class Address < ApplicationRecord
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefectures_id, numericality: { other_than: 1, message: 'Select' }
    validates :municipality
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is out of setting range" }
  end

  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefectures
end
