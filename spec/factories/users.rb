FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'あああ'}
    first_name_kana       {'アアア'}
    last_name             {'えええ'}
    last_name_kana        {'エエエ'}
    birth_date            {'1990-03-29'}
  end
end