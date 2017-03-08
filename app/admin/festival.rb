ActiveAdmin.register Festival, :namespace => :super_admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    column :email
    column :current_sign_in_at
    column :created_at
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :slug
      row :description
      row :facebook
      row :twitter
      row :instagram
      row :resident
      row :soundcloud
      row :ra_link
      row :regular_contact_address
      row :press_contact_address
    end
  end

  form html: { multipart: true } do |f|
    tabs do
      tab 'Festival' do
        f.inputs 'Festival information' do
          f.semantic_errors
          f.input :name, :require => true
          f.input :description, :require => true
          f.input :facebook
          f.input :twitter
          f.input :instagram
          f.input :resident
          f.input :soundcloud
          f.input :youtube
          f.input :regular_contact_address
          f.input :press_contact_address
        end
        f.inputs "Apperance" do
          f.input :logo, :as => :file, label: 'Logo', hint: f.object.new_record? ? f.template.content_tag(:span, "No Logo Yet") : image_tag(f.object.logo.url(:thumb))
          f.input :css
        end
      end
      tab 'Account' do
        f.inputs 'Account Settings' do
          f.semantic_errors
          f.input :email
          f.input :password
          f.input :password_confirmation
        end
      end
  
    end
    f.actions
  end

end

ActiveAdmin.register Festival, :namespace => :admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  menu label: "Festival", priority: 2

  index do
    column :id
    column :name
    actions
  end

  controller do
    define_method(:index) do
      redirect_to edit_admin_festival_path(current_festival.id)
    end
  end
  
  show do |p|
    attributes_table do
      row :name
      row :slug
      row :description
      row :facebook
      row :twitter
      row :instagram
      row :resident
      row :soundcloud
      row :ra_link
      row :regular_contact_address
      row :press_contact_address
      p.images.each do |image|
        row :images do
          content_tag(:span, image.file.url(:original))
        end
      end
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Festival information' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :description, :require => true
      f.input :facebook
      f.input :twitter
      f.input :instagram
      f.input :resident
      f.input :soundcloud
      f.input :youtube
      f.input :regular_contact_address
      f.input :press_contact_address
    end
    f.inputs 'Account Settings' do
      f.semantic_errors
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.inputs "Apperance" do
      f.input :logo, :as => :file, label: 'Logo', hint: f.object.new_record? ? f.template.content_tag(:span, "No Logo Yet") : image_tag(f.object.logo.url(:thumb))
      f.input :css_file, :as => :file, label: 'Css', hint: f.object.new_record? ? f.template.content_tag(:span, "No Css Yet") : content_tag(f.object.css_file.url)
    end
    f.inputs "Meta information" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
      f.input :keywords
      f.input :url
    end

    f.inputs "Menu Items" do
      f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
        t.input :menu_title_home
        t.input :menu_title_artists
        t.input :menu_title_events
        t.input :menu_title_news
        t.input :menu_title_videos
        t.input :menu_title_venues
        t.input :menu_title_contacts
      end
    end
    f.actions
  end
end
