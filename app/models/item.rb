class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  with_options presence: true do
    validates :image, presence: { message: 'を選択してください' }
    validates :product_name
    validates :description
    validates :category, numericality: { other_than: 0, message: 'を選択してください' }
    validates :condition, numericality: { other_than: 0, message: 'を選択してください' }
    validates :contribution, numericality: { other_than: 0, message: 'を選択してください' }
    validates :shipping_area, numericality: { other_than: 0, message: 'を選択してください' }
    validates :days_to_ship, numericality: { other_than: 0, message: 'を選択してください' }
    validates :selling_price, numericality: { only_integer: true, greater_than_or_equal_to: 300,
                                              less_than_or_equal_to: 9_999_999,
                                              message: 'は¥300~¥9,999,999の整数で入力してください' }
  end
end
