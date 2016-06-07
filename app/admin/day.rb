ActiveAdmin.register Day, :namespace => :super_admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    column :date
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :slug
      row :date
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :date, as: :datepicker, :require => true
    end
    f.actions
  end

end

ActiveAdmin.register Day, :namespace => :admin do
  
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  scope_to :current_festival

  before_create do |day|
    day.festival = current_festival
  end

  index do
    column :id
    column :name
    column :date
    actions
  end

  filter :name
  filter :date
  
  show do |p|
    attributes_table do
      row :name
      row :slug
      row :date
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :date, as: :datepicker, :require => true
    end

    f.actions
  end

end
