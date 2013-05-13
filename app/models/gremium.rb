class Gremium < ActiveRecord::Base
  self.table_name = "gremium"
  validates :title, uniqueness: true

  has_many :sitzung
  has_many :vorlage, through: :sitzung
end
