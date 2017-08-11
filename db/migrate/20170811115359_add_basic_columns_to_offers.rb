class AddBasicColumnsToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :title,         :text
    add_column :offers, :description,   :text
    add_column :offers, :location,      :text
  end
end
