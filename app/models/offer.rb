class Offer < ApplicationRecord
  belongs_to  :role
  belongs_to  :company
  belongs_to  :currency
  has_many    :skills_requirements
  has_many    :technologies,  through: :skills_requirements
  has_many    :levels,        through: :skills_requirements

  validates :title, :description, :role, :company, presence: true
end
