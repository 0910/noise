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
    f.inputs "Video Images" do
      f.has_many :images do |i|
        i.input :file, as: :file, label: false, hint: i.object.new_record? ? i.template.content_tag(:span, "No Image Yet") : image_tag(i.object.file.url(:thumb))
        i.input :_destroy, as: :boolean, label: "Destroy?" unless i.object.new_record?
      end 
    end
    f.actions
  end

end

