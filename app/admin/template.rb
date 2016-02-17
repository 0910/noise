ActiveAdmin.register Template do

  scope_to :current_festival

  before_create do |template|
    template.festival = current_festival
  end

  index do
    column :id
    column :name
    column :partial
    column :path
    actions
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :festival
      f.input :name, :require => true
      f.input :body, :require => true
      f.input :partial, :require => true
      f.input :path, :require => true
      f.input :format, :require => true
      f.input :handler, :require => true
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
