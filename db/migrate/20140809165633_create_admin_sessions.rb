class CreateAdminSessions < ActiveRecord::Migration
  def change
    create_table :admin_sessions do |t|
      t.string :session_id, null: false
      t.text :data

      t.timestamps
    end

    add_index :admin_sessions, :session_id
    add_index :admin_sessions, :updated_at
  end
end
