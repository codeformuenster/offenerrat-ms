class Sitzung < ActiveRecord::Base
  self.table_name = "sitzung"

  scope :kommende, lambda { where("datum >= ?", Time.zone.now.beginning_of_day ).order("datum ASC") }
  scope :abgelaufende, lambda { where("datum < ?", Time.zone.now.beginning_of_day ).order("datum DESC") }
  scope :ohne_termin, lambda { where("datum IS NULL or CAST(datum as text) = ''") }
  scope :zustaendig, lambda { where("typ LIKE %Entscheidung%") }

  belongs_to :gremium
  has_many :vorlagen, through: :sitzung_vorlage, source: :vorlage
  has_many  :sitzung_vorlage


  def formatted_datum
    self.datum.strftime('%d.%m.%Y')
  end
  def short_datum
    self.datum.strftime('%d.%m.')
  end
end
