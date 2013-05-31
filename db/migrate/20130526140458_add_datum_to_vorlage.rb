class AddDatumToVorlage < ActiveRecord::Migration
  def up
    add_column :vorlage, :datum, :datetime
  end

  def down
  end
end
