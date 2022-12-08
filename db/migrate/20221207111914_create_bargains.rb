class CreateBargains < ActiveRecord::Migration[7.0]
  def change
    create_table :bargains do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.string :status, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
