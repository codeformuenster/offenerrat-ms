class Member < ActiveRecord::Base
  
  belongs_to :party
  belongs_to :district
  has_many :gremium
  
end
