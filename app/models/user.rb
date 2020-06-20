class User < ApplicationRecord
  has_many :missions
  has_secure_password
end
