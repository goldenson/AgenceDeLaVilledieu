ActiveAdmin.register House do

  permit_params :type, :name, :address, :area, :mainarea, :piece, :room, :bathroom, :toilette, :price, :energy, :impact, :tax, :heating, :construction, :outdoorarea, :floor, :description, :type_id

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
