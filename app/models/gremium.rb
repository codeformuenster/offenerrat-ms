class Gremium < ActiveRecord::Base
  self.table_name = "gremium"
  validates :title, uniqueness: true

  has_many :sitzung
  has_many :vorlagen, through: :sitzung, source: :vorlagen
  has_one :subject

  include PgSearch
  def vorlagen_count
    self.vorlagen.count
  end

  def typen
    SitzungVorlage.joins(:sitzung).where("sitzung.gremium_id = ?",self.id)
  end

  def next_sitzung
    self.sitzung.kommende.first
  end
  def last_sitzung
    self.sitzung.abgelaufende.first
  end


  def to_s
    self.title
  end
end
