class Items < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name, null: false
      t.string     :description,  null: false
      t.integer    :category_id,     null: false
      t.integer    :condition_id,    null: false
      t.integer    :contribution_id, null: false
      t.integer    :prefecture_id,   null: false
      t.integer    :days_to_ship_id, null: false
      t.integer    :selling_price,null: false
      t.references :user,         null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
