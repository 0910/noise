ActiveAdmin.register News, :namespace => :super_admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :title
    column :date
    translation_status
    actions
  end
  
  show do |p|
    attributes_table do
      row :date
      row :title
      row :subtitle
      row :body
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :date
      f.inputs "Translated fields" do
        f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
          t.input :title
          t.input :subtitle
          t.input :body
        end
      end
    end
    f.inputs "News Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

end

ActiveAdmin.register News, :namespace => :admin do
  
  scope_to :current_festival

  before_create do |news|
    news.festival = current_festival
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :title
    column :date
    translation_status
    actions
  end

  filter :title
  filter :subtitle
  filter :date
  filter :created_at
  
  show do |p|
    attributes_table do
      row :id
      row :title
      row :slug
      row :subtitle
      row :body
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'News Information' do
      f.semantic_errors
      f.input :date
      f.inputs "Translated fields" do
        f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
          t.input :title
          t.input :subtitle
          t.input :body
        end
      end
    end
    f.inputs "News Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

end

