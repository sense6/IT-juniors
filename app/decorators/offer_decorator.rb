class OfferDecorator < ApplicationDecorator
  delegate_all

  def salary
    "#{object.salary_min}#{offer.currency.symbol} - #{object.salary_min}#{offer.currency.symbol}"
  end

end
