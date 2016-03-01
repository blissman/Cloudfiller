class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :Request
  has_many :messages
end
