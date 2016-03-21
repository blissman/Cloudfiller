class Rating < ActiveRecord::Base
  # Tracking for Notifications (defaults to create, update, destroy)
  include PublicActivity::Common
  # tracked owner: ->(controller, model) { controller && controller.current_user }

  # ActiveRecord Relationships
  belongs_to :request
  belongs_to :user

  # ActiveRecord Validations
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

end
