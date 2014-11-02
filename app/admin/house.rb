ActiveAdmin.register House do

  permit_params :type, :name, :address, :area, :mainarea, :piece, :room, :bathroom, :toilette, :price, :energy, :impact, :tax, :heating, :construction, :outdoorarea, :floor, :description, :type_id, pictures_attributes: [:image, :_destroy]

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

 form :html => { :multipart => true } do |f|
   f.inputs "Create house" do
    f.input :name
    f.input :description
    f.input :price
    f.input :type
    f.has_many :pictures do |ff|
      ff.input :image, as: :file, :hint => ff.template.image_tag(ff.object.image.url(:thumb))
      ff.input :_destroy, as: :boolean
    end 
   end
   f.actions
 end


end
