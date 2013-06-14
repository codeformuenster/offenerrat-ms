class Decission < ActiveRecord::Base
  belongs_to :decission_category
  has_many :sitzung_vorlage

end
