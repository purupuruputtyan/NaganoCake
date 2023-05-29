class CreateAddesses < ActiveRecord::Migration[6.1]
  def change
    create_table :addesses do |t|

      t.timestamps
    end
  end
end
