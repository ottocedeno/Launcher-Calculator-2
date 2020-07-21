class User < ApplicationRecord
  has_many :missions
  has_many :rockets, through: :missions
  has_many :spaceports, through: :missions
  has_many :orbits, through: :missions
  
  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
