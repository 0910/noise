ActiveAdmin.register Venue, :namespace => :super_admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    translation_status
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
      f.input :capacity
      f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
        t.input :description
      end
    end
    f.inputs "Venue Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
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
    translation_status
    actions
  end

  filter :name
  filter :created_at
  
  show do |p|
    attributes_table do
      row :id
      row :name
      row :slug
      row :location
      row :description
      row :capacity
      row :photo do
        image_tag(venue.image.url(:thumb))
      end
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Venue Information' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :location
      f.input :capacity
      f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
        t.input :description
      end
    end
    f.inputs "Venue Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end


end