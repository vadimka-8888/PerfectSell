class ChangeColumnType < ActiveRecord::Migration[7.0]
  def up
    change_column :proposers, :additional_information, :text
    change_column :offers, :description, :text
    change_column :stores, :description, :text
    change_column :offers, :photo, :text
    change_column :stores, :photo, :text
  end

  def down
    change_column :offers, :photo, :string
    change_column :stores, :photo, :string
  end
end
