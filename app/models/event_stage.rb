class EventStage < ActiveRecord::Base
  belongs_to :event
  belongs_to :stage
end
