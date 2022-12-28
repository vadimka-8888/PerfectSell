ActiveAdmin.register Bargain do
  permit_params :offer, :date, :status, :store

  index do
    id_column
    column :offer
    column :store
    column :status
    column :date
    actions
  end

  filter :store
  filter :offer
  filter :status, as: :check_boxes, collection: proc { ["Considering", "Accepted"] }
  filter :date
end
