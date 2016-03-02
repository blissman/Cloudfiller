class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :requests
  has_one :experience
  has_many :responses
end
