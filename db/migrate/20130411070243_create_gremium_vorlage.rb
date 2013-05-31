class CreateGremiumVorlage < ActiveRecord::Migration
  def up
    create_table :gremium_vorlage, :id => false do |t|
      t.references :gremium, :vorlage
    end
  end

  def down
  end
end
