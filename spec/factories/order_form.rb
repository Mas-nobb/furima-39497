FactoryBot.define do
  factory :order_form do
    postcode { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    block { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09012345678' }
    token { "tok_#{Faker::Alphanumeric.alphanumeric(number: 28)}" }
    association :user
    association :item
  end
end
