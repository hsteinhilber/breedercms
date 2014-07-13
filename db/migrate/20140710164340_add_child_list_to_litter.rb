class AddChildListToLitter < ActiveRecord::Migration
  def change
    add_column :pets, :litter_id, :integer
  end
end
