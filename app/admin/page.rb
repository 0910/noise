ActiveAdmin.register Page, :namespace => :super_admin do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    translation_status
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :body
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
        t.input :name
        t.input :body
      end
    end
    f.actions
  end

end

ActiveAdmin.register Page, :namespace => :admin do
  
  scope_to :current_festival

  before_create do |page|
    page.festival = current_festival
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    translation_status
    actions
  end

  filter :name
  filter :body
  filter :created_at
  
  show do |p|
    attributes_table do
      row :id
      row :name
      row :body
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Page Information' do
      f.semantic_errors
      f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
        t.input :name
        t.input :body
      end
    end
    f.actions
  end

end

