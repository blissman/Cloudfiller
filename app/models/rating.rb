class Rating < ActiveRecord::Base
  # Tracking for Notifications (defaults to create, update, destroy)
  include PublicActivity::Common
  # tracked owner: ->(controller, model) { controller && controller.current_user }

  # callback for adding user points on rating
  before_create do
    if self.user != self.request.user
      self.user.points = self.user.points + self.request.points
      self.user.save
    end
  end

  # ActiveRecord Relationships
  belongs_to :request
  belongs_to :user

  # ActiveRecord Validations
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :user_id, presence: true

end
