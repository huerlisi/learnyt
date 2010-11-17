class Event < ActiveRecord::Base
  has_event_calendar
  belongs_to :object, :polymorphic => true

  def name
    object.try(:to_s) || self[:name]
  end
end
