class Mission < ApplicationRecord
  belongs_to :user
  belongs_to :rocket
  belongs_to :spaceport
  belongs_to :orbit

  validates :name, presence: true
  validates :name, uniqueness: true

end
