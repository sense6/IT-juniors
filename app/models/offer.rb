class Offer < ApplicationRecord
  belongs_to  :role
  belongs_to  :company
  belongs_to  :currency
  has_many    :skills_requirements
  has_many    :technologies,  through: :skills_requirements
  has_many    :levels,        through: :skills_requirements

  validates :title, :description, :role, :company, presence: true

  def self.filter_technologies(search)
    if search
      Offer.joins(:technologies)
           .where('technologies.name LIKE ? OR offers.title LIKE ? OR offers.description LIKE ? OR offers.location LIKE ?', "%#{search}%","%#{search}%","%#{search}%","%#{search}%").distinct
    else
      all
    end
  end
end
