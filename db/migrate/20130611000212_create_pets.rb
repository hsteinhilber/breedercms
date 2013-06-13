class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.date :birth_date

      t.timestamps
    end
  end
end
