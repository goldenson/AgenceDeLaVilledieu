ActiveAdmin.register House do

  permit_params :type, :name, :address, :area, :mainarea, :piece, :room, :bathroom, :toilette, :price, :energy, :impact, :tax, :heating, :construction, :outdoorarea, :floor, :description, :type_id, pictures_attributes: [:id, :image, :_destroy]

  show do |ad|
    
    attributes_table do
      row :name
    end

    panel "Photos" do
      table_for house.pictures do
        column "name" do |picture|
          image_tag(picture.image.url(:thumb))
        end
      end
    end

  end


  index do
    column :price do |house|
      number_to_currency house.price, :unit => "€"
    end
    column :name
    actions
  end

  form :html => { :multipart => true } do |f|
   f.inputs "Photos" do
    f.has_many :pictures do |ff|
      ff.input :image, as: :file, :hint => ff.template.image_tag(ff.object.image.url(:thumb))
      ff.input :_destroy, as: :boolean
    end 
   end

   f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :type, :label => "Category", :hint => "Selectionner une categorie"
   end
   f.actions
 end

end
