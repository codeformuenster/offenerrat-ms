class CreateSitzungen < ActiveRecord::Migration
  def up
    create_table :sitzung do |t|
      t.datetime :datum
      t.string :stadt_id
      t.text :bezeichnung
      t.text :raum
      t.string :detail_url
      t.string :typ
      t.belongs_to :vorlage
      t.belongs_to :gremium
      t.timestamps
    end
  end

  def down
  end
end
