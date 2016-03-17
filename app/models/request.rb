class Request < ActiveRecord::Base
  before_create do
    self.active = true
  end

  after_create do
    self.user.points = self.user.points - self.points
    self.user.save
  end

  belongs_to :user
  belongs_to :category
  has_many :responses

  validates :category_id, :description, presence: true
  validates :expire,
  validates :points, numericality: { only_integer: true, :greater_than_or_equal_to 1, :less_than_or_equal_to self.user.points }
end
