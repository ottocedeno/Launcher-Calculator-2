class Mission < ApplicationRecord
  belongs_to :user
  belongs_to :rocket
  belongs_to :spaceport
  belongs_to :orbit
  has_one :mission_result
end
