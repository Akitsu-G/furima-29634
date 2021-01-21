class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number,
                :token, :user_id, :item_id, :order_id

  with_options presence: true do
    validates :token, presence: { message: 'が不正です' }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'が不正です' }
    validates :city
    validates :house_number
    validates :phone_number, numericality: { only_integer: true, message: 'は半角数字で入力してください' },
                             length: { in: 10..11, message: 'は10桁または11桁で入力してください' }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください' }

  def save
    order = Order.create!(user_id: user_id, item_id: item_id)
    Address.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                    building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
