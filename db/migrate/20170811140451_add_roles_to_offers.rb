class AddRolesToOffers < ActiveRecord::Migration[5.1]
  def change
    add_reference :offers, :role, index: true
  end
end
