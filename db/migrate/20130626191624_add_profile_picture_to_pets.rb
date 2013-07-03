class AddProfilePictureToPets < ActiveRecord::Migration
  def change
    add_column :pets, :profile_picture, :string
  end
end
