class Offer < ApplicationRecord
  belongs_to  :role
  belongs_to  :company
  belongs_to  :currency
  has_many    :skills_requirements
  has_many    :technologies,  through: :skills_requirements
  has_many    :levels,        through: :skills_requirements

  validates :title, :description, :role, :company, presence: true

  def self.filter_technologies(search)
    return all unless search.present?
    Offer.joins(:technologies).where('name LIKE ?', "%#{search}%")
  end
end
