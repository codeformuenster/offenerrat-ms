class Notification < ActiveRecord::Base
  attr_accessible :email, :model, :model_id
  validates :email, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i,
      message: "Falsches Format" }
  validates :email, presence: true
  
end
