class CreateAdminUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_users do |t|
      t.string :full_name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
