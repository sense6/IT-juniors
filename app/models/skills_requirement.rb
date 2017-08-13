class SkillsRequirement < ApplicationRecord
  belongs_to :offer
  belongs_to :level
  belongs_to :technology
end
