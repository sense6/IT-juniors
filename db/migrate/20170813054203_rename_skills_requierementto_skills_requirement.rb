class RenameSkillsRequierementtoSkillsRequirement < ActiveRecord::Migration[5.1]
  def change
    rename_table :skills_requierements, :skills_requirements
  end
end
