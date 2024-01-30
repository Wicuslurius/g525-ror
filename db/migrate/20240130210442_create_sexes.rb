class CreateSexes < ActiveRecord::Migration[7.0]
  def change
    create_table :sexes do |t|
      t.string :description

      t.timestamps
    end
  end
end
