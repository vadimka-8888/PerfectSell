ActiveAdmin.register Bargain do
  permit_params :offer, :date, :status, :store, :offer_id, :store_id

  index do
    id_column
    column :offer
    column :store
    column :status
    column :date
    actions
  end

  show do
    panel "Bargain details" do
      attributes_table_for bargain do
        row("Offer") { bargain.offer.name }
        row("Store") { bargain.store.name }
        row("Status") { bargain.status }
        row("Date") { bargain.date }
      end
    end
  end

  filter :store
  filter :offer
  filter :status, as: :check_boxes, collection: proc { ["Considering", "Accepted"] }
  filter :date

  scope :all, default: true
  scope :most_recent
end
