class Subject < ActiveRecord::Base
  belongs_to :gremium

  has_many :vorlagen, through: :gremium, source: :vorlagen

  attr_accessible :title, :gremium_id

  default_scope order(:title)
  scope :last_month , lambda { Subject.joins(:gremium => [:sitzung => [:vorlagen]]).where("sitzung.datum <= ? AND sitzung.datum >= ?", Time.zone.now.beginning_of_day,1.months.ago).group("subjects.title,subjects.id").select("subjects.*,COUNT(vorlage.id) as vorlagen_count").order("vorlagen_count DESC") }
  scope :next_month , lambda { Subject.joins(:gremium => [:sitzung => [:vorlagen]]).where("sitzung.datum <= ? AND sitzung.datum >= ?", 1.months.from_now, Time.zone.now.beginning_of_day).group("subjects.title,subjects.id").select("subjects.*,COUNT(vorlage.id) as vorlagen_count").order("vorlagen_count DESC") }

  def vorlagen_statd_ids
    self.vorlagen.pluck(:stadt_id)
  end

  def to_s
    title
  end

end
