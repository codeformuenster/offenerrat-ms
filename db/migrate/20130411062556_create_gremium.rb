class CreateGremium < ActiveRecord::Migration
  def up
    create_table :gremium do |t|
      t.string :title
      t.string :detail_url
    end
  end

  def down
  end
end
