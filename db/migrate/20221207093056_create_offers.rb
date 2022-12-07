class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :name, null: false
      t.string :measure
      t.decimal :price, null: false
      t.string :description
      t.boolean :is_active, null: false
      t.string :photo

      t.timestamps
    end
  end
end
