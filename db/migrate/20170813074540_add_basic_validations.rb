class AddBasicValidations < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users,                :first_name, false
    change_column_null :companies,            :name, false
    change_column_null :levels,               :name, false
    change_column_null :roles,                :name, false
    change_column_null :skills,               :user_id, false
    change_column_null :skills,               :level_id, false
    change_column_null :skills,               :technology_id, false
    change_column_null :skills_requirements,  :offer_id, false
    change_column_null :skills_requirements,  :level_id, false
    change_column_null :skills_requirements,  :technology_id, false
    change_column_null :offers,               :title, false
    change_column_null :offers,               :description, false
    change_column_null :offers,               :company_id, false
    change_column_null :offers,               :role_id, false
    change_column_null :technologies,         :name, false
  end
end
