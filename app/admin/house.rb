ActiveAdmin.register House do

  permit_params :type, :name, :address, :area, :mainarea, :piece, :room, :bathroom, :toilette, :price, :energy, :impact, :tax, :heating, :construction, :outdoorarea, :floor, :description, :type_id, pictures_attributes: [:id, :image, :_destroy]

  show do |ad|
    
    attributes_table do
      row :name
      row :type
      row :address
      row :area
      row :mainarea
      row :piece
      row :room
      row :bathroom
      row :toilette
      row :price
      row :energy
      row :impact
      row :tax
      row :heating
      row :construction
      row :outdoorarea
      row :floor
      row :description
    end

    panel "Photos" do
      table_for house.pictures do
        column "photo" do |picture|
          image_tag(picture.image.url(:thumb))
        end
      end
    end

  end


  index do
    column :name
    column :address
    column :type
    column :piece
    column :area
    column :price do |house|
      number_to_currency house.price, :unit => "€"
    end
    actions
  end

  form :html => { :multipart => true } do |f|

   f.inputs "Informations Principales" do
      f.input :type, :label => "Category", :hint => "Selectionner une categorie"
      f.input :price
      f.input :name
      f.input :address
      f.input :description
      f.input :area
      f.input :piece
      f.input :room
      f.input :bathroom
      f.input :toilette
      f.input :mainarea
      f.input :outdoorarea
   end

   f.inputs "Details" do
      f.input :energy
      f.input :impact
      f.input :tax
      f.input :heating
      f.input :construction
      f.input :floor
   end

   f.inputs "Photos" do
     f.has_many :pictures do |ff|
       ff.input :image, as: :file, :hint => ff.template.image_tag(ff.object.image.url(:thumb))
       ff.input :_destroy, as: :boolean
     end 
    end

   f.actions
 end

end
