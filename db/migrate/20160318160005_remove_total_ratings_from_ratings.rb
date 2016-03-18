class RemoveTotalRatingsFromRatings < ActiveRecord::Migration
  def change
    remove_column :ratings, :total_ratings, :integer
  end
end
