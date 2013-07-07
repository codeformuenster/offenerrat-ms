#encoding: utf-8
class Sitzung < ActiveRecord::Base
  self.table_name = "sitzung"
  attr_accessible :datum
  scope :kommende, lambda { where("datum >= ?", Time.zone.now.beginning_of_day ).order("datum ASC") }
  scope :kommende_fuenf, lambda { where("datum >= ?", Time.zone.now.beginning_of_day ).order("datum ASC").limit(5) }
  scope :heute, lambda { where(datum: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day ) }
  scope :morgen, lambda { where(datum: Time.zone.now.tomorrow.beginning_of_day..Time.zone.now.tomorrow.end_of_day ) }
  scope :kommende_nach_morgen, lambda { where("datum >= ?", Time.zone.now.tomorrow.end_of_day ).order("datum ASC") }
  scope :dieser_monat, lambda { where(datum: Time.zone.now.beginning_of_day..1.month.from_now ).order("datum ASC") }
  scope :letzter_monat, lambda { where(datum: 1.month.ago..Time.zone.now.beginning_of_day ).order("datum DESC") }
  scope :abgelaufende, lambda { where("datum < ?", Time.zone.now.beginning_of_day ).order("datum DESC") }
  scope :ohne_termin, lambda { where("datum IS NULL or CAST(datum as text) = ''") }
  scope :zustaendig, lambda { where("typ LIKE '%Entscheidung%'") }
  scope :feed, lambda { where("datum < ?", Time.zone.now.tomorrow.end_of_day ).order("datum DESC") }

  belongs_to :gremium
  has_many :vorlagen, through: :sitzung_vorlage, source: :vorlage
  has_many  :sitzung_vorlage
  has_many :subjects, through: :vorlagen, source: :subjects

  include PgSearch

  def formatted_datetime
    self.datum.strftime('%d.%m.%Y %H:%M')
  end
  def formatted_time
    self.datum.strftime('%H:%M')
  end
  def formatted_datum
    self.datum.strftime('%d.%m.%Y')
  end
  def short_datum
    self.datum.strftime('%d.%m.')
  end
  def intelligent_datum
    if self.datum < DateTime.now.beginning_of_year
      formatted_datum
    else
      short_datum
    end
  end
  def time
    self.datum.strftime('%H:%M')
  end
  def to_count
    "0"
  end
  def themen
    subjects.uniq unless gremium.subject
  end

  def entscheidungen
    self.sitzung_vorlage.entscheidungen.all
  end

  def berichte
    self.sitzung_vorlage.berichte.all
  end

  def antraege
    self.sitzung_vorlage.antraege.all
  end

  def typ_for_vorlage(vorlage)
    self.sitzung_vorlage.joins(:vorlage).where(vorlage_id: vorlage).first.typ
  end

  def vorlagen_for_subject(subject)
    self.vorlagen.joins(:subjects).where("subjects.id = ?",subject.id).uniq.all
  end


  def base_url
    Offenerrat::Application::BASE_URL
  end
  def description
    "Nächste Sitzung am #{formatted_datum} um #{formatted_time}, #{raum}"
  end
  def to_s
    "#{formatted_datetime} #{gremium.title}"
  end
end
