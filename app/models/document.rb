class Document < ActiveRecord::Base
  belongs_to :vorlage

  include PgSearch
  multisearchable :against => [:title, :html]

  def vorlagen_title
    self.vorlage.title
  end

  def self.resource_index_attributes
    [:title, :vorlagen_title]
  end

end
