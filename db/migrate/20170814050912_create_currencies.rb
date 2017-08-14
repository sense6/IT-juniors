class CreateCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :currencies do |t|
      t.string :symbol
      t.string :short_name

      t.timestamps
    end
  end
end
