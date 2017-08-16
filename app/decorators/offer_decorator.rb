class OfferDecorator < ApplicationDecorator
  delegate_all

  def salary
    "#{object.salary_min}#{offer.currency.symbol} - #{object.salary_min}#{offer.currency.symbol}"
  end

  def min_salary
    "#{object.salary_min}#{offer.currency.symbol}"
  end

  def short_desc
    "#{object.description[0,70]}..."
  end

end
