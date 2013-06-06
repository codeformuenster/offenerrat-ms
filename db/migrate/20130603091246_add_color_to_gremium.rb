class AddColorToGremium < ActiveRecord::Migration
  def change
    add_column :gremium, :color, :string
  end
end
