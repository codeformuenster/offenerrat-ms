class SitzungVorlage < ActiveRecord::Base
  self.table_name = "sitzung_vorlage"
  belongs_to :sitzung
  belongs_to :vorlage
  belongs_to :decission

  scope :entscheidungen, lambda { where("typ LIKE '%Entscheidung%'") }
  scope :berichte, lambda { where("typ LIKE '%Bericht%'") }
  scope :antraege, lambda { where("typ LIKE '%Antrag%'") }

end
