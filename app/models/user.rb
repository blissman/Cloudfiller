class User < ActiveRecord::Base
  has_many :experiences
  has_many :requests
  has_many :responses
  

end
