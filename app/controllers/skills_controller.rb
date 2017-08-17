class SkillsController < ApplicationController
  def create
    @skill = Skill.new(user_id: params[:user_id],technology_id: params[:technology_id], level_id: params[:level_id]).save
    redirect_to request.referer
  end

  def destroy
    @skill = Skill.find_by(user_id: params[:user_id],technology_id: params[:technology_id])
    @skill.destroy
    redirect_to request.referer
  end
end
