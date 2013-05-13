class SitzungVorlage < ActiveRecord::Base
  self.table_name = "sitzung_vorlage"
  belongs_to :sitzung
  belongs_to :vorlage
end
