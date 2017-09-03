class Company < ApplicationRecord
  has_many  :offers
  belongs_to :user, optional: true

  validates :name, presence: true
end
