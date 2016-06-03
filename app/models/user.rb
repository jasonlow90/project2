class User < ActiveRecord::Base
  has_secure_password
  has_one :profile
  has_many :destinations
  has_many :messages
  validates :email, presence: true, uniqueness: true
end
