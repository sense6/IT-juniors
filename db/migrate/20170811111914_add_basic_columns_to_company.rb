class AddBasicColumnsToCompany < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :name,         :text
    add_column :companies, :description,  :text
    add_column :companies, :phone,        :string
    add_column :companies, :address,      :text
    add_column :companies, :nip,          :text
    add_column :companies, :krs,          :text
    add_column :companies, :web_page,     :text
  end
end
