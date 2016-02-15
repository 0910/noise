ActiveAdmin.register Sponsor, :namespace => :super_admin do

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
      row :link
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Sponsor Information' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :link
    end
    f.inputs "Sponsor Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

end
ActiveAdmin.register Sponsor, :namespace => :admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  scope_to :current_festival

  before_create do |sponsor|
    sponsor.festival = current_festival
  end

  index do
    column :id
    column :name
    actions
  end

  filter :name
  filter :link
  filter :created_at
  
  show do |p|
    attributes_table do
      row :id
      row :name
      row :slug
      row :link
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Sponsor Information' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :link
    end
    f.inputs "Sponsor Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end


end