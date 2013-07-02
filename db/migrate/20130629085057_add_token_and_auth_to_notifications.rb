class AddTokenAndAuthToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :token, :string
    add_column :notifications, :authenticated, :boolean, default: false
  end
end
