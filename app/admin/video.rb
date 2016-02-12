ActiveAdmin.register Video, :namespace => :super_admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    column :festival
    column 'Featured', :sortable => :featured do |resource|
      column_select(resource, :featured, ["No", "Yes"])
    end
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :slug
      row :description
      row :link
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :slug
      f.input :description
      f.input :link, :require => true
    end
    f.actions
  end

end

ActiveAdmin.register Video, :namespace => :admin do
  
  scope_to :current_festival

  before_create do |video|
    video.festival = current_festival
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    column 'Featured', :sortable => :featured do |resource|
      column_select(resource, :featured, ["No", "Yes"])
    end
    actions
  end
  
  show do |p|
    attributes_table do
      row :id
      row :name
      row :description
      row :link
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Video Information' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :description
      f.input :link
    end
    f.inputs "Video Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

end

