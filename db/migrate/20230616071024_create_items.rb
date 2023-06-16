class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :condition_id
      t.integer :shipping_day_id
      t.integer :prefecture_id
      t.integer :shipping_fee_status_id
      t.integer :price

      t.timestamps
    end
  end
end
