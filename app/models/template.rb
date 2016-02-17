class Template < ActiveRecord::Base
  belongs_to :festival
  store_templates
end
