class CreateSitzungenVorlage < ActiveRecord::Migration
  def up
    create_table :sitzung_vorlage, :id => false do |t|
      t.integer :sitzung_id
      t.integer :vorlage_id
      t.string :typ
    end
    change_table :sitzung do |t|
      t.remove :vorlage_id
      t.remove :typ
    end
  end

  def down
  end
end
