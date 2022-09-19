FactoryBot.define do
  factory :item do
    name               {'商品名'}
    explanation        {'説明文'}
    price              {1000}
    category_id        {2}
    condition_id       {2}
    delivery_charge_id {2}
    area_id            {2}
    days_id            {2}


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
