class Rating < ActiveRecord::Base

  belongs_to :user

  before_save do
    if self.total_ratings == nil
      self.total_ratings = 1
    else
      self.total_ratings += 1
    end
  end


end
