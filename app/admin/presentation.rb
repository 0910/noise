ActiveAdmin.register Presentation, :namespace => :super_admin do

  csv_importable :columns => [:name, :description, :Starts_on, :finishes_on, :slug, :created_at, :updated_at, :time, :duration ], :import_unique_key => :code

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    actions
  end
  
  show do |p|
    attributes_table do
      row :id
      row :name
      row :slug
      row :event
      row :stage
      row :artist
      row :description
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Show Information' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :event, :as => :select
      f.input :artist, :as => :select
      f.input :description
    end
    f.actions
  end

end

ActiveAdmin.register Presentation, :namespace => :admin do
  
  scope_to :current_festival

  before_create do |show|
    show.festival = current_festival
  end

  csv_importable :columns => [:name, :description, :starts_on, :finishes_on, :slug, :created_at, :updated_at, :time, :duration ], :import_unique_key => :code

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    actions
  end

  filter :name
  filter :artist
  filter :event
  filter :stage
  filter :created_at
  
  show do |p|
    attributes_table do
      row :id
      row :name
      row :slug
      row :event
      row :stage
      row :artist
      row :starts_on
      row :finishes_on
      row :description
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Show Information' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :event, :as => :select2
      f.input :stage, :as => :select2
      f.input :artist, :as => :select2, :collection => Artist.all, :include_blank => false, :require => true
      f.input :time, :require => true
      f.input :ends, :require => true
      f.input :duration, :require => true
      #f.input :starts_on
      #f.input :finishes_on
      f.input :description
    end
    f.actions
  end

end

