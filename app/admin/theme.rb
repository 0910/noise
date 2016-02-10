ActiveAdmin.register Theme, :namespace => :super_admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  scope_to :current_festival

  before_create do |theme|
    theme.festival = current_festival
  end

  index do
    column :id
    column :name
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :slug
    end
  end

  form html: { multipart: true } do |f|
    tabs do
      tab 'Basic' do
        f.inputs 'Basic Options' do
          f.input :name
        end
      end
      tab 'Advanced' do
        f.inputs 'Advanced Customization' do
          f.input :custom_html, label: 'Custom HTML'
          f.input :custom_css, label: 'Custom CSS'
          f.input :custom_js, label: 'Custom JS'
        end
      end
      tab 'Backgrounds' do
        f.inputs 'Background Images' do
          f.input :home_photo, :as => :file, label: 'Main Background', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.home_photo.url(:thumb))
          f.input :intro_photo, :as => :file, label: 'Header Background', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.intro_photo.url(:thumb))
          f.input :artists_photo, :as => :file, label: 'Artists Background', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.artists_photo.url(:thumb))
          f.input :events_photo, :as => :file, label: 'Events Background', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.events_photo.url(:thumb))
          f.input :news_photo, :as => :file, label: 'News Background', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.news_photo.url(:thumb))
          f.input :venues_photo, :as => :file, label: 'Venues Background', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.venues_photo.url(:thumb))
          f.input :videos_photo, :as => :file, label: 'Videos Background', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.videos_photo.url(:thumb))
        end
      end
    end
    f.actions
  end

end

ActiveAdmin.register Theme, :namespace => :admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  scope_to :current_festival

  before_create do |theme|
    theme.festival = current_festival
  end

  index do
    column :id
    column :name
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :slug
    end
  end

  form html: { multipart: true } do |f|
    tabs do
      tab 'Basic' do
        f.inputs 'Basic Options' do
          f.input :name
        end
      end
      tab 'Advanced' do
        f.inputs 'Advanced Customization' do
          f.input :custom_html, label: 'Custom HTML'
          f.input :custom_css, label: 'Custom CSS'
          f.input :custom_js, label: 'Custom JS'
        end
      end
      tab 'Backgrounds' do
        f.inputs 'Background Images' do
          f.input :home_photo, :as => :file, label: 'Main Background', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.home_photo.url(:thumb))
          f.input :intro_photo, :as => :file, label: 'Header Background', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.intro_photo.url(:thumb))
          f.input :artists_photo, :as => :file, label: 'Artists Background', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.artists_photo.url(:thumb))
          f.input :events_photo, :as => :file, label: 'Events Background', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.events_photo.url(:thumb))
          f.input :news_photo, :as => :file, label: 'News Background', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.news_photo.url(:thumb))
          f.input :venues_photo, :as => :file, label: 'Venues Background', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.venues_photo.url(:thumb))
          f.input :videos_photo, :as => :file, label: 'Videos Background', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.videos_photo.url(:thumb))
        end
      end
    end
    f.actions
  end

end
