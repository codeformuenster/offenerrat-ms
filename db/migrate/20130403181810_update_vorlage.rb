class UpdateVorlage < ActiveRecord::Migration
  def up
    change_table :vorlage do |t|
      t.string :stadt_id
      t.timestamps
    end
  end

  def down
  end
end
