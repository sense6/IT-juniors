class Offer < ApplicationRecord
  has_one   :role
  has_one   :company
  has_many  :skills_requierements
  has_many  :technologies,  through: :skills_requierements
  has_many  :levels,        through: :skills_requierements
end
