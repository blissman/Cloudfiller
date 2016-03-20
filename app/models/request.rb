class Request < ActiveRecord::Base
  before_create do
    self.active = true
    self.user.points = self.user.points - self.points
    self.user.save
  end

  belongs_to :user
  belongs_to :category
  has_many :responses
  has_many :conversations

  validates :category_id, :description, presence: true
  validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validate :expiration_date_limits

  def expiration_date_limits
    if self.expire == nil
      errors.add(:expire, "can't be left bank.")
    elsif self.expire < Date.today
      errors.add(:expire, "can't be in the past.")
    elsif self.expire > (Date.today + 30.days)
      errors.add(:expire, "can't be more than 30 days in the future.")
    end
  end

  def self.expire_requests
    Request.all.each do |request|
      if request.active == true
        if request.expire <= Date.today
          request.active = false
          request.save
        end
      end
    end
  end

end
