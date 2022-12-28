ActiveAdmin.register Offer do
  permit_params :name, :measure, :price, :description, :is_active, :photo, :proposer_id

  index do
    id_column
    column :name
    column :measure
    column :price
    column :proposer
    column :description
    column :is_active
    column :photo
    actions
  end

  filter :name
  filter :price
  filter :is_active, label: "Activeness", as: :check_boxes
end
