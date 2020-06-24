class User < ApplicationRecord
  has_many :missions
  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
