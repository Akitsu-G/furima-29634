FactoryBot.define do
  factory :item do
    # item
    product_name         { Faker::Games::Zelda.game }
    description          { Faker::Lorem.paragraph(sentence_count: 3) }
    category             { Faker::Number.within(range: 1..10) }
    condition            { Faker::Number.within(range: 1..6) }
    contribution         { Faker::Number.within(range: 1..2) }
    shipping_area        { Faker::Number.within(range: 1..47) }
    days_to_ship         { Faker::Number.within(range: 1..3) }
    selling_price        { Faker::Number.within(range: 300..9_999_999) }
  end
end
