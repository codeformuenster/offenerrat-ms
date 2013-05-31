class TruncateTable < ActiveRecord::Migration
  def up
    execute 'TRUNCATE TABLE sitzung_vorlage'
    execute 'TRUNCATE TABLE sitzung'
  end

  def down
  end
end
