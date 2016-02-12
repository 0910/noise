ActiveAdmin.register News, :namespace => :super_admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :title
    column :date
    actions
  end
  
  show do |p|
    attributes_table do
      row :title
      row :subtitle
      row :date
      row :body
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :title, :require => true
      f.input :subtitle
      f.input :date
      f.input :body
    end
    f.inputs "News Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

end

ActiveAdmin.register News, :namespace => :admin do
  
  scope_to :current_festival

  before_create do |news|
    news.festival = current_festival
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :title
    column :date
    actions
  end
  
  show do |p|
    attributes_table do
      row :id
      row :title
      row :slug
      row :subtitle
      row :body
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'News Information' do
      f.semantic_errors
      f.input :title, :require => true
      f.input :subtitle
      f.input :date
      f.input :body
    end
    f.inputs "News Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

end

