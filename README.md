# テーブル設計

## テーブル共通

| Column     | Type        |
| ---------- | ----------- |
| id         | primary_key |
| created_at | datetime    |
| updated_at | datetime    |

## users テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| kanji_name    | string | null: false |
| hiragana_name | string | null: false |
| katakana_name | string | null: false |
| birth         | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| product_name  | string     | null: false                    |
| description   | string     | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| contribution  | integer    | null: false                    |
| shipping_area | string     | null: false                    |
| days_to_ship  | integer    | null: false                    |
| selling_price | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: true                     |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order
