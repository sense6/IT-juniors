class RenameUsersTechnologiesLevelsToSkills < ActiveRecord::Migration[5.1]
  def change
    rename_table :users_technologies_levels, :skills
  end
end
