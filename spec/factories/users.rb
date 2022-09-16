FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '山田' }
    first_name_kana       { 'ヤマダ' }
    last_name             { '太郎' }
    last_name_kana        { 'タロウ' }
    birth                 { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
