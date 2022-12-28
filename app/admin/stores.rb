ActiveAdmin.register Store do
  permit_params :name, :address, :description, :store_email, :store_password, :photo

  index do
    id_column
    column :name
    column :address
    column :description
    column :store_email
    column :photo
  end

  filter :name
  filter :address_contains
end
