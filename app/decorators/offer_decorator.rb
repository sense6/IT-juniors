class OfferDecorator < ApplicationDecorator
  delegate_all

  def salary
    "#{object.salary_min}#{offer.currency.symbol} - #{object.salary_max}#{offer.currency.symbol}"
  end

  def min_salary
    "#{object.salary_min}#{offer.currency.symbol}"
  end

  def short_desc(limit = 70)
    return object.description if object.description.length < limit
    "#{object.description[0, limit].strip}..."
  end
end
