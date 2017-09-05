class Technology < ApplicationRecord
  validates :name, presence: true

  def self.filter_user_technologies(user)
    tech = Technology.where("id NOT IN (?)", user.technologies.map {|t| t.id})
    if !tech.empty?
      tech
    else
      Technology.all
    end
  end

  def self.filter_skill_req_technologies(offer)
    tech = Technology.where("id NOT IN (?)", offer.technologies.map {|t| t.id})
    if !tech.empty?
      tech
    else
      Technology.all
    end
  end
end
