ActiveAdmin.register House do

  before_filter :only => [:show, :edit] do
    @house = House.friendly.find(params[:id])
  end

  permit_params :type, :name, :address, :area, :mainarea, :piece, :room, :bathroom, :toilette, :price, :energy, :impact, :tax, :fee, :charge, :lot, :heating, :construction, :outdoorarea, :floor, :description, :type_id, :proprio, :slug, pictures_attributes: [:id, :image, :_destroy]

  show do |ad|
    
    attributes_table do
      row :name
      row :proprio
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
      row :fee
      row :charge
      row :lot
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
    selectable_column
    
    column :nom, :name
    column :nom_du_proprio, :proprio
    column :addresse, :address
    column :categorie, :type
    column :nombre_de_piece, :piece
    column :superficie, :area
    column :price do |house|
      number_to_currency house.price, :unit => "€"
    end
    actions
  end

  form :html => { :multipart => true } do |f|

   f.semantic_errors *f.object.errors.keys

   f.inputs "Informations Principales" do
      f.input :type, :label => "Categorie", :hint => "Selectionner une categorie"
      f.input :price, :label => "Prix"
      f.input :name, :label => "Nom"
      f.input :proprio, :label => "Nom du proprio"
      f.input :address, :label => "Adresse"
      f.input :description
      f.input :area, :label => "Superficie"
      f.input :piece, :label => "Nombre de piece"
      f.input :room, :label => "Nombre de chambre"
      f.input :bathroom, :label => "Nombre de salle de bain"
      f.input :toilette, :label => "Nombre de toilette"
      f.input :mainarea, :label => "Superficie salon"
      f.input :outdoorarea, :label => "Superficie jardin"
   end

   f.inputs "Details" do
      f.input :energy, :label => "Energie"
      f.input :impact, :label => "Emmision GES"
      f.input :tax, :label => "Taxe fonciere"
      f.input :fee, :label => "Frais D'agence"
      f.input :charge, :label => "Charges annuelles"
      f.input :lot, :label => "Nombre de lots"
      f.input :heating, :label => "Type de chauffage"
      f.input :construction, :label => "Annee de construction"
      f.input :floor, :label => "Etage"
   end

   f.inputs "Photos" do
     f.has_many :pictures do |ff|
       ff.input :image, as: :file, :hint => ff.template.image_tag(ff.object.image.url(:thumb))
       ff.input :_destroy, as: :boolean
     end 
    end

   f.actions
 end
 config.filters = false

 # controller do
 #   @house = House.friendly.find(params[:id])
 # end

end
