FactoryBot.define do
  factory :purchase_shipping do
    postal_code           { '111-1111' }
    prefecture_id         { 2 }
    municipality          { '荻窪' }
    address               { '荻窪' }
    tel                   { '09011112222' }
    token                 { 'tok_2fa5084cb5f6da51e79927dd71b6' }
    building              { 'マンション' }
  end
end