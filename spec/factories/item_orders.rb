FactoryBot.define do
  factory :item_order do
    postal_code { '123-4567' }
    prefectures_id { Faker::Number.between(from: 2, to: 48) }
    municipality { '北市' }
    house_number { '北一丁目1-1' }
    building_name { '北ビル' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
