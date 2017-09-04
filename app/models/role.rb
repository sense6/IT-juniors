class Role < ApplicationRecord
  has_many :offers

  validates :name, presence: true
end
