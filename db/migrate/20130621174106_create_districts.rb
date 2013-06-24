class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.integer :gremium_id
      t.timestamps
    end
  end
end
