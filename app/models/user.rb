class User < ActiveRecord::Base
  # Tracking for Notifications (defaults to create, update, destroy)
  include PublicActivity::Model
  tracked

  # Sorcery authentication
  authenticates_with_sorcery!

  # ActiveRecord Relationships
  has_many :requests, :dependent => :delete_all
  has_one :experience, :dependent => :delete
  has_many :ratings, :dependent => :delete_all
  accepts_nested_attributes_for :experience
  accepts_nested_attributes_for :ratings
  has_many :responses, :dependent => :delete_all
  has_many :messages, :dependent => :delete_all
  has_many :conversations, :foreign_key => :sender_id, :dependent => :delete_all
  has_many :conversations, :foreign_key => :recipient_id, :dependent => :delete_all

  # ActiveRecord Validations
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }
  validates :email, uniqueness: true
  validates :name, presence: true
  validates :lastname, presence: true
  validates :points, presence: true
  validate :user_points_must_be_positive

  # Validation Methods
  def user_points_must_be_positive
    if self.points < 0
      errors.add(:points,": you don't have enough points for that.")
    end
  end

end
