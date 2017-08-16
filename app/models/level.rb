class Level < ApplicationRecord
  validates :name, presence: true

  translates :name, :description

  def cache_key
    super + '-' + Globalize.locale.to_s
  end
end
