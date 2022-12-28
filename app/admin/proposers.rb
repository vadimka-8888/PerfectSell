ActiveAdmin.register Proposer do
  permit_params :full_name, :email, :password, :additional_information

  index do
    id_column
    column :full_name
    column :email
    column :additional_information
  end

  filter :full_name, label: "Name"

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # or
  #
  # permit_params do
  #   permitted = [:full_name, :email, :password, :additional_information]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
