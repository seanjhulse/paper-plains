class AddNetidToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :netid, :string
  end
end
