ActiveAdmin.register House do

  permit_params :type, :name, :address, :area, :mainarea, :piece, :room, :bathroom, :toilette, :price, :energy, :impact, :tax, :fee, :charge, :lot, :heating, :construction, :outdoorarea, :floor, :description, :type_id, pictures_attributes: [:id, :image, :_destroy]

  show do |ad|
    
    attributes_table do
      row :nom, :name
      row :categorie, :type
      row :addresse, :address
      row :superficie, :area
      row :superficie_salon, :mainarea
      row :nombre_de_piece, :piece
      row :nombre_de_chambre, :room
      row :nombre_de_salle_de_bain, :bathroom
      row :nombre_de_toilette, :toilette
      row :prix, :price
      row :energie, :energy
      row :emision_ges, :impact
      row :taxe_fonciere, :tax
      row :frais_agence, :fee
      row :charges_annuelles, :charge
      row :nombre_de_lots, :lot
      row :type_de_chauffage, :heating
      row :annee_de_construction, :construction
      row :superficie_jardin, :outdoorarea
      row :etage, :floor
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

   f.inputs "Informations Principales" do
      f.input :type, :label => "Categorie", :hint => "Selectionner une categorie"
      f.input :price, :label => "Prix"
      f.input :name, :label => "Nom"
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
end
