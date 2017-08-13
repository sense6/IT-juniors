class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :level
  belongs_to :technology
end
