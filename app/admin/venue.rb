ActiveAdmin.register Venue, :namespace => :super_admin do

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
      row :location
      row :description
      row :capacity
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Venue Information' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :event, :as => :select
      f.input :location
      f.input :description
      f.input :capacity
    end
    f.inputs "Venue Images" do
      f.has_many :images do |i|
        i.input :file, as: :file, label: false, hint: i.object.new_record? ? i.template.content_tag(:span, "No Image Yet") : image_tag(i.object.file.url(:thumb))
        i.input :_destroy, as: :boolean, label: "Destroy?" unless i.object.new_record?
      end 
    end
    f.actions
  end

end
ActiveAdmin.register Venue, :namespace => :admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  scope_to :current_festival

  before_create do |venue|
    venue.festival = current_festival
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
      row :location
      row :description
      row :capacity
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Venue Information' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :location
      f.input :description
      f.input :capacity
    end
    f.inputs "Venue Images" do
      f.has_many :images do |i|
        i.input :file, as: :file, label: false, hint: i.object.new_record? ? i.template.content_tag(:span, "No Image Yet") : image_tag(i.object.file.url(:thumb))
        i.input :_destroy, as: :boolean, label: "Destroy?" unless i.object.new_record?
      end 
    end
    f.actions
  end


end