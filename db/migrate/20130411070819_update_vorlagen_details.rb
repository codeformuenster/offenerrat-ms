class UpdateVorlagenDetails < ActiveRecord::Migration
  def up
    change_table :vorlage do |t|
      t.string :name
      t.string :zustaendig
    end

  end

  def down
  end
end
