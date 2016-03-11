ActiveAdmin.register Artist, :namespace => :super_admin do

  csv_importable :columns => [:name, :ra_link, :facebook_link, :soundcloud_link, :festival_id], :import_unique_key => :code

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    column :country
    translation_status
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :country
      row :bio
      row :facebook_link
      row :soundcloud_link
      row :twitter_link
      row :instagram_link
      row :youtube_link
      row :beatport_link
      row :ra_link
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :country
      f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
        t.input :bio
      end
      f.input :facebook_link
      f.input :soundcloud_link
      f.input :twitter_link
      f.input :instagram_link
      f.input :youtube_link
      f.input :beatport_link
      f.input :ra_link
    end

    f.inputs "Artist Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

end

ActiveAdmin.register Artist, :namespace => :admin do

  csv do
    column :name
    column :ra_link
    column :facebook_link
    column :soundcloud_link
  end

  csv_importable :columns => [:name, :ra_link, :facebook_link, :soundcloud_link, :festival_id], :import_unique_key => :code
  
  scope_to :current_festival

  before_create do |artist|
    artist.festival = current_festival
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    column :country
    translation_status
    actions
  end

  filter :events
  filter :country
  filter :name
  filter :created_at
  
  show do |p|
    attributes_table do
      row :id
      row :name
      row :slug
      row :country
      row :bio
      row :facebook_link
      row :soundcloud_link
      row :twitter_link
      row :instagram_link
      row :youtube_link
      row :beatport_link
      row :ra_link
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Artist Information' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :country
      f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
        t.input :bio
      end
      f.input :facebook_link
      f.input :soundcloud_link
      f.input :twitter_link
      f.input :instagram_link
      f.input :youtube_link
      f.input :beatport_link
      f.input :ra_link
    end
    f.inputs "Artist Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

end

