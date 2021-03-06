class Offer < ApplicationRecord
  belongs_to  :company
  belongs_to  :currency
  belongs_to  :role
  has_many    :skills_requirements
  has_many    :technologies,  through: :skills_requirements
  has_many    :levels,        through: :skills_requirements
  has_many    :job_applications
  has_many    :applicants,    through: :job_applications, source: :user

  validates :title, :description, :role, :company, presence: true

  def self.filter_offers(search)
    if search
      Offer.eager_load(:technologies,:role).where(
              "technologies.name LIKE ? OR
              offers.title LIKE ? OR
              offers.description LIKE ? OR
              offers.location LIKE ? OR
              roles.name LIKE ?",
              "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%")
              .distinct
    else
      all
    end
  end
end
