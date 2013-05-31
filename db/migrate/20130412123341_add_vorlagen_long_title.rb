class AddVorlagenLongTitle < ActiveRecord::Migration
  def up
    change_table :vorlage do |t|
      t.text :long_title
    end
  end

  def down
  end
end
