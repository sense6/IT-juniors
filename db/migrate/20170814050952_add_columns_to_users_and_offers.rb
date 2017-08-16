class AddColumnsToUsersAndOffers < ActiveRecord::Migration[5.1]
  def change
    add_column    :users,   :github_name, :string
    add_column    :users,   :admin,       :boolean, default: false
    add_reference :users,   :company, index: true

    add_column    :offers,  :salary_min,  :integer
    add_column    :offers,  :salary_max,  :integer
    add_reference :offers,  :currency
  end
end
