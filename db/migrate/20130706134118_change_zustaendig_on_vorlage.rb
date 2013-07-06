class ChangeZustaendigOnVorlage < ActiveRecord::Migration
  def up
    rename_column :vorlage, :zustaendig, :zustaendig_string
    add_column :vorlage, :zustaendig, :integer
    Vorlage.reset_column_information
    Vorlage.all.each do |vorlage|
      vorlage.zustaendig = vorlage.sitzung.zustaendig.first
      vorlage.save
    end
    remove_column :vorlage, :zustaendig_string
  end

  def down
  end
end
