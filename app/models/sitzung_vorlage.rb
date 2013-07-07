class SitzungVorlage < ActiveRecord::Base
  self.table_name = "sitzung_vorlage"
  belongs_to :sitzung, touch: true
  belongs_to :vorlage, touch: true
  belongs_to :decission

  scope :entscheidungen, lambda { where("typ LIKE '%Entscheidung%'") }
  scope :berichte, lambda { where("typ LIKE '%Bericht%'") }
  scope :antraege, lambda { where("typ LIKE '%Antrag%'") }
  scope :next_sitzung, lambda { joins(:sitzung).where("sitzung.datum > ?",Time.now).order("sitzung.datum DESC")}

  def self.types
    SitzungVorlage.order("typ").pluck(:typ).uniq
  end

end
