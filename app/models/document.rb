class Document < ActiveRecord::Base
  belongs_to :vorlage
  default_scope order("documents.id DESC")
  scope :latest, lambda { joins(:vorlage).order("vorlage.updated_at") }

  include PgSearch
  multisearchable :against => [:title, :html]

  def vorlagen_title
    self.vorlage.title
  end

  def to_s
    "#{title} (#{vorlage.name})"
  end

  def self.resource_index_attributes
    [:title, :vorlagen_title]
  end

end
