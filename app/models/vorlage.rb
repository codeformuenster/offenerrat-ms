class Vorlage < ActiveRecord::Base
  self.table_name = "vorlage"
  validates :stadt_id, uniqueness: true


  has_many :gremium, through: :sitzung
  has_many :sitzung, through: :sitzung_vorlage, include: :sitzung_vorlage
  has_many :sitzung_vorlage
  has_many :subjects, through: :gremium
  has_many :documents
  has_many :districts, through: :gremium

  scope :letzte, lambda { where("vorlage.datum <= ?", Time.zone.now.beginning_of_day ).order("vorlage.datum DESC") }
  scope :letzter_monat , lambda { where(datum: 1.month.ago.beginning_of_day..Time.zone.now.beginning_of_day ).order("vorlage.datum DESC") }
  scope :beschlossene, lambda { joins(:sitzung_vorlage).joins(:sitzung).where("sitzung_vorlage.decission_id IN (?) AND sitzung_vorlage.typ = 'Entscheidung'",Decission.beschlossen.all).order("sitzung.datum DESC").group("vorlage.id, sitzung.datum") }
  scope :in_beratung, lambda { joins(:sitzung).where("sitzung.datum > ?",Time.zone.now.beginning_of_day).order("sitzung.datum ASC").group("vorlage.id, sitzung.datum") }

  scope :by_district, -> district { includes(:districts).where("districts.id = ?", district) }
  scope :by_subject, -> subject { includes(:subjects).where("subjects.id = ?", subject) }
  scope :by_gremium, -> gremium { joins(:gremium).where("gremium.id = ?", gremium) }
  scope :by_type, -> type { joins(:sitzung_vorlage).where("sitzung_vorlage.typ = ?", type) }

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
  def formatted_datum
    datum.strftime('%d.%m.%Y')
  end

  def ratsvorlage?
    decission_session.gremium.title == "Rat"
  end

  def verantwortlich
    decission_session.gremium if decission_session
  end

  def in_beratung?
    sitzung.order(:datum).last.datum < Time.now if sitzung.last
  end

  def entscheidung_getroffen?
    (decission_session && beschluss) || entscheidung
  end

  def aktueller_vorgang
    if in_beratung?
      unless entscheidung_getroffen?
        "noch keine Entscheidung bekannt"
      else
        beschluss ? beschluss : entscheidung
      end
    else
      "in Beratung"
    end
  end

  def decission_session
    self.sitzung.zustaendig.first
  end
  def entscheidungs_sitzung
    decission_session.sitzung_vorlage.find_by_vorlage_id(self.id) if decission_session
  end
  def entscheidung
    decission = sitzung_vorlage.first.decission
    if decission
      unless decission.decission_category == 1
        decission.title
      else
        self.sitzung_vorlage.first.decission.decission_category.title
      end
    end
  end
  def beschluss
    entscheidungs_sitzung.decission.decission_category.title if entscheidungs_sitzung && entscheidungs_sitzung.decission
  end
  def decission_session_title
    self.decission_session.gremium.title
  end
  def decission_session_color
    self.decission_session.gremium.color
  end
  def decission_content
    if sitzung = sitzung_for_gremium(decission_session.gremium)
      content = "Entscheidung: #{sitzung.formatted_datum}"
      content += beschluss ? " #{beschluss}" : " #{entscheidung}"
    else
      "Entscheidung"
    end
  end

  def gremien_sitzungen
    self.sitzung.includes(:gremium).order("sitzung.datum DESC")
  end

  def typ_for_sitzung(sitzung)
    self.sitzung_vorlage.find_by_sitzung_id(sitzung).typ
  end
  def entscheidung_for_sitzung(sitzung)
    self.sitzung_vorlage.find_by_sitzung_id(sitzung).decission
  end

  def typ_for_gremium(gremium)
    self.sitzung_vorlage.joins(:sitzung).where("sitzung.gremium_id = ?",gremium.id).first.typ
  end

  def sitzung_for_gremium(gremium)
    self.sitzung.where(gremium_id: gremium).first
  end
  def gremium_content(gremium)
    if sitzung = sitzung_for_gremium(gremium)
      content = "#{typ_for_gremium(gremium)}: #{sitzung.formatted_datum}"
      content += " #{entscheidung}" if entscheidung
    else
      typ_for_gremium(gremium)
    end
  end

  def gremien_list
    self.gremium.map(&:to_s).join(', ')
  end

  def gremien_path
    if self.decission_session
      self.gremium.where('gremium.id <> ?',self.decission_session.gremium.id).includes(:sitzung).order('sitzung.datum DESC')
    else
      self.gremium.includes(:sitzung).order('sitzung.datum DESC')
    end
  end

  def to_s
    "#{name}: #{title}"
  end
  def details
    if beschluss
      "#{formatted_datum}, #{beschluss}"
    else
      "#{formatted_datum}"
    end
  end

  def description
    "Beteiligte Gremien: #{gremien_list}"
  end

  def next_step
    if in_beratung?
      unless entscheidung_getroffen?
        "keine Entscheidung bekannt"
      else
        beschluss ? "#{beschluss} (#{decission_session.formatted_datum})" : "#{entscheidung} (#{sitzung_vorlage.first.sitzung.formatted_datum})"
      end
    elsif sitzung_vorlage.next_sitzung.last
      sitzung = sitzung_vorlage.next_sitzung.last.sitzung
      "in Beratung: #{sitzung.formatted_datum} #{sitzung.gremium.title}"
    end
  end

  def self.resource_index_attributes
    [:title, :name]
  end

end
