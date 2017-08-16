class Company < ApplicationRecord
  has_many  :offers

  validates :name, presence: true
end
