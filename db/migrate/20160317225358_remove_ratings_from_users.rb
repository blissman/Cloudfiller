class RemoveRatingsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :rating, :float
    remove_column :users, :total_ratings, :integer
  end
end
