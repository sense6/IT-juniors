class CompanyDecorator < ApplicationDecorator
  delegate_all

  decorates_association :offers

end
