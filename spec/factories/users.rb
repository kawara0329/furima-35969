FactoryBot.define do
  factory :user do
    nickname              { '1a' + Faker::Name.initials(number: 2) }
    email                 { '1a' + Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { 'あああ' }
    first_name_kana       { 'アアア' }
    last_name             { 'えええ' }
    last_name_kana        { 'エエエ' }
    birth_date            { '1990-03-29' }
  end
end
