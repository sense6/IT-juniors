class ColumnNameChangeCurrency < ActiveRecord::Migration[5.1]
  def change
    rename_column :currencies, :short_name, :name
  end
end
