ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  action_item do
    link_to "Ajouter un Bien", new_admin_house_path, class: 'btn btn-default'      
  end
  
  content title: proc{ I18n.t("active_admin.dashboard") } do

    panel "Liste des derniers biens" do
      table_for House.order('created_at desc').limit(10) do
        column "Categorie" do |a|
          a.type.name
        end
        column "Biens" do |a|
          link_to a.name, admin_house_path(a.id)
        end
        column "Proprio" do |a|
          a.proprio
        end
        column "Nombre de pieces" do |a|
          a.piece
        end
        column "Superficie" do |a|
          a.area
        end
        column "Prix" do |a|
          status_tag((number_to_currency a.price, :unit => "€"), (:ok))
        end
      end
    end

  end

end
