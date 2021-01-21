FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.unique.free_email }
    password              { Faker::Internet.password(min_length: 4, max_length: 126, mix_case: true) + '1a' }
    # fakerの性質上、英字のみ・数字のみの場合が偶発するため上限・下限をずらしています(min_length: 6-2, max_length: 128-2)
    password_confirmation { password }
    last_name             { Faker::Name.last_name }
    first_name            { Faker::Name.first_name }
    last_name_kana        { Faker::Creature::Cat.breed } # 姓(カナ)の代わりに猫の血統名を使用しています
    first_name_kana       { Faker::Ancient.god } # 名(カナ)の代わりに神名を使用しています
    birth                 { Faker::Date.birthday }
  end
end
