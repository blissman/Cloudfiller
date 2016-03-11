class Message < ActiveRecord::Base
  belongs_to :response
  has_one :user, through: :response  
end
