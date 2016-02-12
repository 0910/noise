ActiveAdmin.register Artist, :namespace => :super_admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    column :country
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
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :country
      f.input :bio
      f.input :facebook_link
      f.input :soundcloud_link
      f.input :twitter_link
      f.input :instagram_link
      f.input :youtube_link
      f.input :beatport_link
    end
    f.inputs "Artist Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

end

ActiveAdmin.register Artist, :namespace => :admin do
  
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
    actions
  end
  
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
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Artist Information' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :country
      f.input :bio
      f.input :facebook_link
      f.input :soundcloud_link
      f.input :twitter_link
      f.input :instagram_link
      f.input :youtube_link
      f.input :beatport_link
    end
    f.inputs "Artist Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

end

