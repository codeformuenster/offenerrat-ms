class Decission < ActiveRecord::Base
  belongs_to :decission_category
  has_many :sitzung_vorlage

  scope :beschlossen,lambda { where(decission_category_id: DecissionCategory.find(1)) }
end
