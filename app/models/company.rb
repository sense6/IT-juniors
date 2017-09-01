class Company < ApplicationRecord
  has_many  :offers
  belongs_to :user

  validates :name, presence: true
end
