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

  show do
    panel "Offer Details" do
      attributes_table_for offer do
        row("Name") { offer.name }
        row("Measure") { offer.measure }
        row("Price") { offer.price }
        row("Description") { offer.description }
        row("Activeness") { offer.is_active }
        row("Photo") { offer.photo }
      end
    end
    active_admin_comments
  end

  filter :name
  filter :price
  filter :is_active, label: "Activeness", as: :check_boxes

  scope :all, default: true
  scope :only_items
end
