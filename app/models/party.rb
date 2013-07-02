class Party < ActiveRecord::Base
  has_many :vorlage
  has_many :members
  
  attr_accessible :name, :alt_names
end
