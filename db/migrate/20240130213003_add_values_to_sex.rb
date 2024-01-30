class AddValuesToSex < ActiveRecord::Migration[7.0]
  def change
    Sex.create(description: 'Male')
    Sex.create(description: 'Female')
    Sex.create(description: 'Does not have')
  end
end
