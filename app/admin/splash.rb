ActiveAdmin.register Splash, :namespace => :super_admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

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
      p.images.each do |image|
        row :images do
          content_tag(:span, image.file.url(:original))
        end
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
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

end

ActiveAdmin.register Splash, :namespace => :admin do
  
  scope_to :current_festival

  before_create do |splash|
    splash.festival = current_festival
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
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
      row :slug
      row :subtitle
      row :body
      p.images.each do |image|
        row :images do
          content_tag(:span, image.file.url(:original))
        end
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
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

end

