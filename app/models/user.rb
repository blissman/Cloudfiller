class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :requests
  has_one :experience
  has_many :responses

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :email, uniqueness: true
  validates :name, presence: true
  validates :lastname, presence: true
end
