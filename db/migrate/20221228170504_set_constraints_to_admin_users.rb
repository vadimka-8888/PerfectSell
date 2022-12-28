class SetConstraintsToAdminUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :admin_users, :full_name, false
    change_column_null :admin_users, :email, false
    change_column_null :admin_users, :password, false
  end
end
