ActiveAdmin.register Widget, :namespace => :super_admin do

  index do
    column :id
    column :name
    column :created_at
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :code
      row :festival
      row :created_at
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :name
      f.input :code
    end
    f.actions
  end

end

ActiveAdmin.register Widget, :namespace => :admin do
  
  scope_to :current_festival

  before_create do |widget|
    widget.festival = current_festival
  end

  index do
    column :id
    column :name
    column :created_at
    actions
  end

  filter :name
  filter :code
  filter :created_at
  
  show do |p|
    attributes_table do
      row :id
      row :name
      row :code
      row :created_at
      row :festival
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :name
      f.input :code
    end
    f.actions
  end

end

