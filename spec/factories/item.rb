FactoryBot.define do
  factory :item do
    association :user
    name { "Example Item" }
    description { "This is an example item." }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id { 2 }
    shipping_day_id { 2 }
    price { 500 } # ここでpriceを定義します

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'image.jpg')), filename: 'image.jpg', content_type: 'image/jpeg')
    end
  end
end

