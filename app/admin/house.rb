ActiveAdmin.register House do

  permit_params :type, :name, :address, :area, :mainarea, :piece, :room, :bathroom, :toilette, :price, :energy, :impact, :tax, :heating, :construction, :outdoorarea, :floor, :description, :type_id, :image

  # form :html => { :enctype => "multipart/form-data" } do |f|
  #   f.inputs "Details" do
  #     f.input :name
  #     f.input :description
  #     f.input :price
  #     f.input :type
  #     f.has_many :pictures do |ff|
  #       ff.input :image, as: :file, :hint => ff.template.image_tag(ff.object.image.url(:medium))
  #       ff.input :_destroy, as: :boolean
  #     end
  #   end
  #   f.actions
  # end

  form :html => { :multipart => true } do |f|
   f.inputs "House information" do
     f.input :name
     f.input :description
     f.input :image, required: false
   end

   # f.inputs "House images" do
   #   f.has_many :pictures do |p|
   #     p.input :image, :as => :file, :label => "Image",:hint => p.object.image.nil? ? p.template.content_tag(:span, "No Image Yet") : p.template.image_tag(p.object.image.url(:thumb))
   #     p.input :_destroy, :as=>:boolean, :required => false, :label => 'Remove image'
   #   end 
   # end

   # f.inputs "House details" do
   #   f.input :type, :label => "Category", :hint => "Select one category"
   #   f.input :address
   #   f.input :price
   # end
   f.actions
 end
 show do |ad|
  attributes_table do
    row :name
    row :image do
      image_tag(ad.image.url(:thumb))
    end
    # Will display the image on show object page
  end
 end

  index do
    column :price do |house|
      number_to_currency house.price, :unit => "€"
    end
    column :name
  actions
  end

end
