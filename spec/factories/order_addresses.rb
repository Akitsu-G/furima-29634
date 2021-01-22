FactoryBot.define do
  factory :order_address do
    token           { Faker::Internet.password(min_length: 28, mix_case: true).to_s.insert(0, 'tok_') }
    postal_code     { Faker::Address.postcode }
    prefecture_id   { Faker::Address.state_abbr }
    city            { Faker::Address.city }
    house_number    { Faker::Address.street_address }
    building_name   { Faker::Address.street_name }
    phone_number    { Faker::PhoneNumber.cell_phone.gsub!('-', '') }
    user_id         { Faker::Number.within(range: 1..999) }
    item_id         { Faker::Number.within(range: 1..999) }
  end
end
