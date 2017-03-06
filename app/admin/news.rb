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
      p.images.each do |image|
        row :image do
          image_tag(image.file.url(:thumb))
        end
      end

    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :date, as: :datepicker
      f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
        t.input :title
        t.input :subtitle
        t.input :body
      end
      f.input :news_type, as: :select2, :collection => ['normal', 'video'], :include_blank => false
      f.input :link
      f.input :video
    end
    f.inputs "Images" do
      f.has_many :images do |i|
        i.input :file, as: :file, label: false, hint: i.object.new_record? ? i.template.content_tag(:span, "No Image Yet") : image_tag(i.object.file.url(:thumb))
        i.input :cover, as: :boolean, label: "Cover"
        i.input :_destroy, as: :boolean, label: "Destroy?" unless i.object.new_record?
      end 
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
      p.images.each do |image|
        row :images do
          content_tag(:span, image.file.url(:original))
        end
      end
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'News Information' do
      f.semantic_errors
      f.input :date, as: :datepicker
      f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
        t.input :title
        t.input :subtitle
        t.input :body
      end
      f.input :news_type, as: :select2, :collection => ['normal', 'video'], :include_blank => false
      f.input :link
      f.input :video
      f.input :image, :as => :file, hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

end

