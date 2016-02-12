ActiveAdmin.register Event, :namespace => :super_admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    column :starts_on
    column :finish_on
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :slug
      row :description
      row :starts_on
      row :finish_on
      filter :current_sign_in_at
      filter :sign_in_count
      filter :created_at
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :description, :require => true
      f.input :starts_on, :require => true
      f.input :finish_on, :require => true
      f.input :venues, :as => :select, :collection => Venue.all, :include_blank => false, :require => true, :multiple => true
      f.input :shows, :as => :select, :collection => Show.all, :include_blank => false, :require => true, :multiple => true
      f.input :artists, :as => :select, :collection => Artist.all, :include_blank => false, :require => true, :multiple => true
      f.input :tickets_link
      f.input :tickets_widget
    end
    f.inputs "Event Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

end

ActiveAdmin.register Event, :namespace => :admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  scope_to :current_festival

  before_create do |event|
    event.festival = current_festival
  end

  index do
    column :id
    column :name
    column :starts_on
    column :finish_on
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :slug
      row :description
      row :starts_on
      row :finish_on
      row :venue
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :description, :require => true
      f.input :starts_on, :require => true
      f.input :finish_on, :require => true
      f.input :venue, :as => :select2, :collection => Venue.all, :include_blank => false, :require => true
      f.input :artists, :as => :select, :collection => Artist.where(festival_id: current_festival), :include_blank => false, :require => true, :multiple => true
      f.input :tickets_link
      f.input :tickets_widget
    end
    f.inputs "Event Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

end
