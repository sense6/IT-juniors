class Offer < ApplicationRecord
  has_one   :role
  has_one   :company
  has_many  :skills_requirements
  has_many  :technologies,  through: :skills_requirements
  has_many  :levels,        through: :skills_requirements

  validates :title, :description, :role, :company, presence: true
end
