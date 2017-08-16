class CreateSkillsRequierements < ActiveRecord::Migration[5.1]
  def change
    create_table :skills_requierements do |t|
      t.references :offer, foreign_key: true
      t.references :level, foreign_key: true
      t.references :technology, foreign_key: true

      t.timestamps
    end
  end
end
