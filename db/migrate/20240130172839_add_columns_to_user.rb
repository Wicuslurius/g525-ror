class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :email, :string
    add_column :users, :address, :string
    add_column :users, :living_place, :string
    add_column :users, :observations, :string
    add_column :users, :birthdate, :date
  end
end
