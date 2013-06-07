class Vorlage < ActiveRecord::Base
  self.table_name = "vorlage"
  validates :stadt_id, uniqueness: true


  has_many :gremium, through: :sitzung
  has_many :sitzung, through: :sitzung_vorlage
  has_many :sitzung_vorlage
  has_many :subjects, through: :gremium

  scope :letzte, lambda { where("vorlage.datum <= ?", Time.zone.now.beginning_of_day ).order("vorlage.datum DESC") }

  include PgSearch
  multisearchable :against => [:title, :name]

  def base_url
    Offenerrat::Application::BASE_URL
  end

  def title
    long_title
  end
  def short_title
    title
  end

  def decission
    self.sitzung.where("typ LIKE '%Entscheidung%'").first
  end

  def decission_title
    self.decission.gremium.title
  end
  def decission_color
    self.decission.gremium.color
  end
  def decission_content
    if sitzung = sitzung_for_gremium(decission.gremium)
      "Entscheidung: #{sitzung.formatted_datum}"
    else
      "Entscheidung"
    end
  end

  def typ_for_gremium(gremium)
    self.sitzung_vorlage.joins(:sitzung).where("sitzung.gremium_id = ?",gremium.id).first.typ
  end

  def sitzung_for_gremium(gremium)
    self.sitzung.where(gremium_id: gremium).first
  end
  def gremium_content(gremium)
    if sitzung = sitzung_for_gremium(gremium)
      "#{typ_for_gremium(gremium)}: #{sitzung.formatted_datum}"
    else
      typ_for_gremium(gremium)
    end
  end

  def gremien_list
    self.gremium.map(&:to_s).join(', ')
  end

  def gremien_path
    if self.decission
      self.gremium.where('gremium.id <> ?',self.decission.gremium.id).includes(:sitzung).order('sitzung.datum DESC')
    else
      self.gremium.includes(:sitzung).order('sitzung.datum DESC')
    end
  end

  def to_s
    "#{name}: #{title}"
  end

  def description
    "Beteiligte Gremien: #{gremien_list}"
  end

  def self.resource_index_attributes
    [:title, :name]
  end

end
