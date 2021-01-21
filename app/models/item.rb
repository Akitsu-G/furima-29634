class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :contribution
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :image, presence: { message: 'を選択してください' }
    validates :product_name
    validates :description
    validates :category_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :condition_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :contribution_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :days_to_ship_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :selling_price, numericality: { only_integer: true, greater_than_or_equal_to: 300,
                                              less_than_or_equal_to: 9_999_999,
                                              message: 'は¥300~¥9,999,999の整数で入力してください' }
  end
end
