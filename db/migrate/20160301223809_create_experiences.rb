class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.text :description
      t.string :experience_type
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
