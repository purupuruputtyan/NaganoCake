class CreateAddesses < ActiveRecord::Migration[6.1]
  def change
    create_table :addesses do |t|
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :post_code, null: false, limit: 7
      t.string :address, null: false

      t.timestamps
    end
  end
end
