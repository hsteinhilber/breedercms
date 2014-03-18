class CreateLitters < ActiveRecord::Migration
  def change
    create_table :litters do |t|
      t.string :birth_date
      t.integer :mother_id
      t.integer :father_id

      t.timestamps
    end
    add_index :litters, [:mother_id, :birth_date]
  end
end
