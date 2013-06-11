class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.date :birth_date

      t.timestamps
    end
  end
end
