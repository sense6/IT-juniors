class Technology < ApplicationRecord
  validates :name, presence: true

  def self.filter_tech(user)
    tech = Technology.where("id NOT IN (?)", user.technologies.map {|t| t.id})
    if !tech.empty?
      tech
    else
      Technology.all
    end
  end
end
