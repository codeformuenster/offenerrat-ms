class Decission < ActiveRecord::Base
  belongs_to :decission_category
  has_many :sitzung_vorlage

  scope :beschlossen,lambda { where(decission_category_id: DecissionCategory.find(1)) }
  scope :ohne ,lambda { where(decission_category_id: DecissionCategory.find(3)) }


  def beschlossen?
    decission_category.id == 1
  end
  def beschluss
    decission_category.title
  end

end
