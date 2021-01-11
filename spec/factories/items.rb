FactoryBot.define do
  factory :item do
    # item
    product_name         { Faker::Games::Zelda.game }
    description          { Faker::Lorem.paragraph(sentence_count: 3) }
    category_id          { Faker::Number.within(range: 1..10) }
    condition_id         { Faker::Number.within(range: 1..6) }
    contribution_id      { Faker::Number.within(range: 1..2) }
    prefecture_id        { Faker::Number.within(range: 1..47) }
    days_to_ship_id      { Faker::Number.within(range: 1..3) }
    selling_price        { Faker::Number.within(range: 300..9_999_999) }
  end
end
