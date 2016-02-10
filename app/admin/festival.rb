ActiveAdmin.register Festival, :namespace => :admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  menu label: "Festival", priority: 2
  controller do
    define_method(:index) do
      redirect_to edit_admin_festival_path(current_festival.id)
    end
  end

  index do
    column :id
    column :name
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :slug
      row :description
      row :facebook
      row :twitter
      row :instagram
      row :resident
      row :soundcloud
    end
  end

  form html: { multipart: true } do |f|
    tabs do
      tab 'Festival' do
        f.inputs 'Festival information' do
          f.semantic_errors
          f.input :name, :require => true
          f.input :description, :require => true
          f.input :facebook
          f.input :twitter
          f.input :instagram
          f.input :resident
          f.input :soundcloud
          f.input :themes, :as => :select2, :collection => Theme.where(festival_id: current_festival), :include_blank => false
        end
      end
      tab 'Account' do
        f.inputs 'Account Settings' do
          f.semantic_errors
          f.input :email
          f.input :password
          f.input :password_confirmation
        end
      end
    end
    f.actions
  end

end

ActiveAdmin.register Festival, :namespace => :super_admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    column :email
    column :current_sign_in_at
    column :created_at
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :slug
      row :description
      row :facebook
      row :twitter
      row :instagram
      row :resident
      row :soundcloud
    end
  end

  form html: { multipart: true } do |f|
    tabs do
      tab 'Festival' do
        f.inputs 'Festival information' do
          f.semantic_errors
          f.input :name, :require => true
          f.input :slug, :require => true
          f.input :description, :require => true
          f.input :facebook
          f.input :twitter
          f.input :instagram
          f.input :resident
          f.input :soundcloud
          f.input :theme, :as => :select2, :collection => Theme.all, :include_blank => false
        end
      end
      tab 'Account' do
        f.inputs 'Account Settings' do
          f.semantic_errors
          f.input :email
          f.input :password
          f.input :password_confirmation
        end
      end
    end
    f.actions
  end

end
