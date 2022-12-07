class AddProposerRefToOffers < ActiveRecord::Migration[7.0]
  def change
    add_reference :offers, :proposer, null: false, foreign_key: true
  end
end
