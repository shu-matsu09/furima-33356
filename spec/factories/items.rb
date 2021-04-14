FactoryBot.define do
  factory :item do
    item_name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    delivery_fee_id { Faker::Number.between(from: 2, to: 3) }
    prefectures_id { Faker::Number.between(from: 2, to: 48) }
    days_to_ship_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/files/test_image.jpeg'), filename: 'test_image.jpeg', content_type: 'image/jpeg')
    end
  end
end
