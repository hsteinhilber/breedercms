class AddCommonAttributesToPet < ActiveRecord::Migration
  def change
    add_column :pets, :gender, :string, length: 1
    add_column :pets, :color, :string
    add_column :pets, :eye_color, :string
    add_column :pets, :breed, :string
    add_column :pets, :height, :float
    add_column :pets, :weight, :float
  end
end
