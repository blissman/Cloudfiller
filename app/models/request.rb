class Request < ActiveRecord::Base
  before_create do
    self.active = true
  end

  belongs_to :user
  belongs_to :category
  has_many :responses

  validates :category_id, presence: true
  validates :description, presence: true
  validates :expire, presence: true
  validates :points, presence: true
end
