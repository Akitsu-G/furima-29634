class Items < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name, null: false
      t.string     :description,  null: false
      t.string     :category,     null: false
      t.string     :condition,    null: false
      t.string     :contribution, null: false
      t.string     :shipping_area,null: false
      t.integer    :days_to_ship, null: false
      t.integer    :selling_price,null: false
      t.references :user,         null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
