class AddCompanyToOffer < ActiveRecord::Migration[5.1]
  def change
    add_reference :offers, :company, foreign_key: true
  end
end
