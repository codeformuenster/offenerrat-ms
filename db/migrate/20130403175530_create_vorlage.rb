class CreateVorlage < ActiveRecord::Migration
  def up
    create_table :vorlage do |t|
      t.string :title
      t.string :detail_url
    end
  end

  def down
  end
end
