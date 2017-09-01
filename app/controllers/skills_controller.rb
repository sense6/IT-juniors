class SkillsController < ApplicationController
  def create
    @skill = Skill.new(user_id: params[:user_id],technology_id: params[:technology_id], level_id: params[:level_id]).save
    redirect_to edit_user_path params[:user_id]
  end

  def destroy
    @skill = Skill.find_by(user_id: params[:user_id],technology_id: params[:technology_id])
    @skill.destroy
    redirect_to edit_user_path params[:user_id]
  end
end
