class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :password_digest
      t.integer :points
      t.float :rating

      t.timestamps null: false
    end
  end
end
