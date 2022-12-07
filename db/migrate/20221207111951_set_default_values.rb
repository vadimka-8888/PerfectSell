class SetDefaultValues < ActiveRecord::Migration[7.0]
  def change
    change_column_default :offers, :is_active, true
    change_column_default :bargains, :status, "Considering"
  end
end
