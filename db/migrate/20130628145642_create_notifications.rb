class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :email
      t.string :model
      t.integer :model_id
      t.timestamps
    end
  end
end
