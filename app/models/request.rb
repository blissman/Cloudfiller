class Request < ActiveRecord::Base
  before_create do
    self.active = true
  end

  belongs_to :user
  belongs_to :category
  has_many :responses

  validates :category_id, :description, :expire, :points, presence: true
end
