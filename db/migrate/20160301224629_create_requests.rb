class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.text :description
      t.date :expire
      t.integer :points
      t.integer :user_id
      t.boolean :active
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
