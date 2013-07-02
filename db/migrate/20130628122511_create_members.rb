class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.references :party
      t.references :district
      t.string :profession
      t.integer :age
      t.timestamps
    end
    create_table :gremium_members, :id => false do |t|
      t.integer :gremium_id
      t.integer :member_id
    end
  end
end
