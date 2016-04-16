class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.float :location
      t.string :password
      t.string :cpassword

      t.timestamps null: false
    end
  end
end
