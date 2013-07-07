class AddIndexToModels < ActiveRecord::Migration
  def change
    add_index :decissions, :decission_category_id
    add_index :gremium_vorlage, :vorlage_id
    add_index :gremium_vorlage, :gremium_id
    add_index :sitzung, :gremium_id
    add_index :sitzung_vorlage, :sitzung_id
    add_index :sitzung_vorlage, :vorlage_id
    add_index :subjects, :gremium_id
    add_index :vorlage, :zustaendig
  end
end
