class AddSexToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :sex, null: false, foreign_key: true, default: 3
  end
end
