ActiveAdmin.register Template, :namespace => :super_admin do

  index do
    column :id
    column :name
    column :created_at
    column :updated_at
    actions
  end

  form html: { multipart: true } do |f|
    tabs do
      tab 'Basic' do
        f.inputs 'Basic Options' do
          f.input :name
          f.input :artists_show, :as => :file, label: 'file', hint: f.object.new_record? ? f.template.content_tag(:span, "No File Yet") : image_tag(f.object.artists_show_file_name)
        end
      end
    end
    f.actions
  end


end
