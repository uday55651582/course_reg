class CreateUsers < ActiveRecord::Migration
  def change
      drop_table :users 
      
      create_table :users do |t|
      t.string :username
      t.string :email
      t.string :latitude
      t.string :longitude
      t.string :password
      t.string :type
      t.integer :commodity

      t.timestamps null: false
    end
  end
end
