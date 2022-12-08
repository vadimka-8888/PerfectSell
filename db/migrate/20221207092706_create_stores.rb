class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.string :address
      t.string :description
      t.string :store_email, null: false
      t.string :store_password, null: false
      t.string :photo

      t.timestamps
    end
  end
end
