ActiveAdmin.register Theme, :namespace => :super_admin do

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
    end
    f.inputs "Event Images" do
      f.has_many :images do |i|
        i.input :file, as: :file, label: false, hint: i.object.new_record? ? i.template.content_tag(:span, "No Image Yet") : image_tag(i.object.file.url(:thumb))
        i.input :_destroy, as: :boolean, label: "Destroy?" unless i.object.new_record?
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
      row :custom_html
      row :custom_css
      row :custom_js
    end
  end

  form html: { multipart: true } do |f|
    tabs do
      tab 'Basic' do
        f.inputs 'Basic Options' do
          f.input :name
        end
      end
      tab 'Navigation' do
        f.inputs 'Navigation customizing' do
          f.input :custom_nav_html
          f.input :custom_nav_css
          f.input :custom_nav_js
        end
      end
      tab 'Home' do
        f.inputs 'Home Page Customize' do
          f.input :home_photo, :as => :file, label: 'Background Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.home_photo.url(:thumb))
          f.input :custom_html
          f.input :custom_css
          f.input :custom_js
        end
      end
      tab 'About' do
        f.inputs 'About Page customizing' do
          f.input :intro_photo, :as => :file, label: 'Background Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.intro_photo.url(:thumb))
          f.input :custom_artists_html
          f.input :custom_artists_css
          f.input :custom_artists_js
        end
      end
      tab 'Artists' do
        f.inputs 'Artists Page customizing' do
          f.input :artists_photo, :as => :file, label: 'Background Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.artists_photo.url(:thumb))
          f.input :custom_artists_html
          f.input :custom_artists_css
          f.input :custom_artists_js
        end
      end
      tab 'Events' do
        f.inputs 'Events Page customizing' do
          f.input :events_photo, :as => :file, label: 'Background Image', :hint => f.template.image_tag(f.object.events_photo.url(:thumb))
          f.input :custom_events_html
          f.input :custom_events_css
          f.input :custom_events_js
        end
      end
      tab 'News' do
        f.inputs 'News Page customizing' do
          f.input :news_photo, :as => :file, label: 'Background Image', :hint => f.template.image_tag(f.object.news_photo.url(:thumb))
          f.input :custom_news_html
          f.input :custom_news_css
          f.input :custom_news_js
        end
      end
      tab 'Videos' do
        f.inputs 'Videos Page customizing' do
          f.input :videos_photo, :as => :file, label: 'Background Image', :hint => f.template.image_tag(f.object.videos_photo.url(:thumb))
          f.input :custom_videos_html
          f.input :custom_videos_css
          f.input :custom_videos_js
        end
      end
      tab 'Shows' do
        f.inputs 'Shows Page customizing' do
          f.input :shows_photo, :as => :file, label: 'Background Image', :hint => f.template.image_tag(f.object.shows_photo.url(:thumb))
          f.input :custom_shows_html
          f.input :custom_shows_css
          f.input :custom_shows_js
        end
      end
      tab 'Venues' do
        f.inputs 'Venues Page customizing' do
          f.input :venues_photo, :as => :file, label: 'Background Image', :hint => f.template.image_tag(f.object.venues_photo.url(:thumb))
          f.input :custom_venues_html
          f.input :custom_venues_css
          f.input :custom_venues_js
        end
      end
      tab 'Footer' do
        f.inputs 'Footer customizing' do
          f.input :custom_footer_html
          f.input :custom_footer_css
          f.input :custom_footer_js
        end
      end
    end
    f.actions
  end

end
