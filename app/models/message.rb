class Message < ActiveRecord::Base
  belongs_to :response
  has_a :user, through::response  
end
