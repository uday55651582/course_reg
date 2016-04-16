class AddCommodityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :commodity, :integer
  end
end
