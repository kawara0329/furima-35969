FactoryBot.define do
  factory :item do
    name                      { '1a' + Faker::Name.initials(number: 2) }
    detail                    { 'あああ' }
    category_id               { 1 }
    status_id                 { 1 }
    shipping_charge_id        { 1 }
    prefecture_id             { 1 }
    delivery_day_id           { 1 }
    price                     { 5000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
