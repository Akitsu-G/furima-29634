# テーブル設計

## テーブル共通

| Column     | Type        |
| ---------- | ----------- |
| id         | primary_key |
| created_at | datetime    |
| updated_at | datetime    |

## users テーブル
| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth           | date   | null: false |
※gem deviseを使用しており、自動生成のカラムは一部省略しています。
またカラム名"password"は実際には"encrypted_password"になっています。
### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| product_name  | string     | null: false                    |
| description   | string     | null: false                    |
| category_id      | integer     | null: false                    |
| condition_id     | integer     | null: false                    |
| contribution_id  | integer    | null: false                    |
| prefecture_id    | integer     | null: false                    |
| days_to_ship_id  | integer    | null: false                    |
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
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: true                     |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order
