ActiveAdmin.register Splash, :namespace => :super_admin do

  csv_importable :columns => [:title, :subtitle, :call_to_action, :call_to_action_link, :festival_id], :import_unique_key => :code

  index do
    column :id
    column :title
    translation_status
    actions
  end
  
  show do |p|
    attributes_table do
      row :title
      row :subtitle
      row :call_to_action
      row :call_to_action_link
      row :photo
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
        t.input :title
        t.input :subtitle
        t.input :call_to_action
      end
      f.input :call_to_action_link
    end
    f.inputs "Image" do
      f.input :photo, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

end

ActiveAdmin.register Splash, :namespace => :admin do
  
  csv_importable :columns => [:title, :subtitle, :call_to_action, :call_to_action_link, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :festival_id], :import_unique_key => :code

  scope_to :current_festival

  before_create do |splash|
    splash.festival = current_festival
  end

  index do
    column :id
    column :title
    translation_status
    actions
  end

  filter :title
  filter :subtitle
  filter :call_to_action
  filter :created_at
  
  show do |p|
    attributes_table do
      row :id
      row :title
      row :subtitle
      row :call_to_action
      row :call_to_action_link
      row :photo do
        image_tag(splash.photo.url(:thumb))
      end
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
        t.input :title
        t.input :subtitle
        t.input :call_to_action
      end
      f.input :call_to_action_link
    end
    f.inputs "Image" do
      f.input :photo, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.photo.url(:thumb))
    end
    f.actions
  end

end

