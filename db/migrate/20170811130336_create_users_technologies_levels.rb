class CreateUsersTechnologiesLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :users_technologies_levels do |t|
      t.references :user, foreign_key: true
      t.references :level, foreign_key: true
      t.references :technology, foreign_key: true

      t.timestamps
    end
  end
end
