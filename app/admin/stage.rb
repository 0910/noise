ActiveAdmin.register Stage, :namespace => :super_admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    column :day
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :slug
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :day, :require => true
    end
    f.actions
  end

end

ActiveAdmin.register Stage, :namespace => :admin do
  
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  scope_to :current_festival

  before_create do |stage|
    stage.festival = current_festival
  end

  index do
    column :id
    column :name
    actions
  end

  filter :name
  
  show do |p|
    attributes_table do
      row :name
      row :slug
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :name, :require => true
    end

    f.actions
  end

end
