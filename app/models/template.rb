class Template < ActiveRecord::Base
  belongs_to :festival

  has_attached_file :artists_show, :content_type => { :content_type => "text/html" },
                    :url  => "/assets/templates/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/templates/:id/:style/:basename.:extension"
   validates_attachment_content_type :artists_show, content_type: 'text/html'
end
