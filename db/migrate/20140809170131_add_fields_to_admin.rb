class AddFieldsToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :single_access_token, :string, null: false, default: ''
    add_column :admins, :perishable_token, :string, null: false, default: ''
    add_column :admins, :login_count, :integer, null: false, default: 0
    add_column :admins, :failed_login_count, :integer, null: false, default: 0
    add_column :admins, :last_request_at, :datetime
    add_column :admins, :current_login_at, :datetime
    add_column :admins, :last_login_at, :datetime
    add_column :admins, :current_login_ip, :string
    add_column :admins, :last_login_ip, :string
  end
end
