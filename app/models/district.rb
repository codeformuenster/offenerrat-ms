class District < ActiveRecord::Base
  belongs_to :gremium
  has_many :vorlagen, through: :gremium

  attr_accessible :name, :lat, :lng, :gremium_id

  default_scope order(:name)

  def to_s
    name
  end
end
