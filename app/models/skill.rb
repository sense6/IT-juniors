class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :level
  belongs_to :technology

  validates :user, :level, :technology, presence: true
end
