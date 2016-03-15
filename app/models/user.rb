class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :requests, :dependent => :delete_all
  has_one :experience, :dependent => :delete_all
  accepts_nested_attributes_for :experience
  has_many :responses, :dependent => :delete_all

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :email, uniqueness: true
  validates :name, presence: true
  validates :lastname, presence: true
end
