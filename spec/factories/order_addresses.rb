FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    area_id { '2' }
    address { '青山1-1-1' }
    city { '横浜' }
    building { '横浜ハイツ' }
    phone_number { '00000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
