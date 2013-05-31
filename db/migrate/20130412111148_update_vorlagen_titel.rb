class UpdateVorlagenTitel < ActiveRecord::Migration
  def up
    change_column(:vorlage, :title, :text)
  end

  def down
  end
end
