class FestivalTheme < ActiveRecord::Base
  belongs_to :festival
  belongs_to :theme
end
