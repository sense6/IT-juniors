class SkillsRequierement < ApplicationRecord
  belongs_to :offer
  belongs_to :level
  belongs_to :technology
end
