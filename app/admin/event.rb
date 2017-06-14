ActiveAdmin.register Event, :namespace => :super_admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    translation_status
    column :starts_on
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :slug
      row :desciption
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
      f.inputs "Translated fields" do
        f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
          t.input :description
        end
      end
      f.input :day, :as => :select, :collection => Day.all, :include_blank => false, :require => true, :multiple => true
      f.input :starts_on, :require => true
      f.input :finish_on, :require => true
      f.input :venues, :as => :select, :collection => Venue.all, :include_blank => false, :require => true, :multiple => true
      f.input :shows, :as => :select, :collection => Show.all, :include_blank => false, :require => true, :multiple => true
      f.input :artists, :as => :select, :collection => Artist.all, :include_blank => false, :require => true, :multiple => true
      f.input :stages, :as => :select, :collection => Stage.all, :include_blank => false, :require => true, :multiple => true
      f.input :tickets_link
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
    translation_status
    column :day
    actions
  end

  filter :name
  filter :venue
  filter :starts_at
  filter :created_at
  
  show do |p|
    attributes_table do
      row :name
      row :slug
      row :description
      row :starts_on
      row :finish_on
      row :venue
      row :event_artists do 
        event.artists.collect.each do |a|
          a.name
        end
      end
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :starts_on, as: :datepicker, :require => true
      f.input :finish_on, as: :datepicker, :require => true
      f.input :venue, :as => :select2, :collection => Venue.all, :include_blank => false, :require => true
      f.input :tickets_link
      f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
        t.input :description
      end
      #f.input :artists, :as => :select, :collection => Artist.where(festival_id: current_festival), :include_blank => false, :require => true, :multiple => true
    end
    f.inputs "Event Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end

    f.inputs "Artists" do
      f.has_many :event_artists, sortable: :position do |i|
        i.input :artist, :as => :select2, :collection => Artist.where(festival_id: current_festival), :include_blank => false, :require => true
        i.input :_destroy, as: :boolean, label: "Unlink?" unless i.object.new_record?
      end 
    end
    f.actions
  end

end
