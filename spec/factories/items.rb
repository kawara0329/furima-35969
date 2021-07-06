FactoryBot.define do
  factory :item do
    name                      { '1a' + Faker::Name.initials(number: 2) }
    detail                    { 'あああ' }
    category_id               { 2 }
    status_id                 { 2 }
    shipping_charge_id        { 2 }
    prefecture_id             { 2 }
    delivery_day_id           { 2 }
    price                     { 5000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
