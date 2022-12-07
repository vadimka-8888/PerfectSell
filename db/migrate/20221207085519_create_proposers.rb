class CreateProposers < ActiveRecord::Migration[7.0]
  def change
    create_table :proposers do |t|
      t.string :full_name, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :additional_information

      t.timestamps
    end
  end
end
