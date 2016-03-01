class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :response_id
      t.text :description

      t.timestamps null: false
    end
  end
end
