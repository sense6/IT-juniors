class SkillsController < ApplicationController
  def create
    #default level has id: 6
    @skill = Skill.new(user_id: params[:user_id],technology_id: params[:technology_id], level_id: 6).save
    redirect_to edit_user_path params[:user_id]
  end

  def destroy
    @skill = Skill.find(params[:skill_id])
    @skill.destroy
    redirect_to edit_user_path params[:user_id]
  end

  def update
    @skill = Skill.find(params[:skill_id])
    if @skill.update(level_id: params[:level_id])
      flash[:success] = "skill updated"
      redirect_to request.referer 
    else
      redirect_to edit_user_path params[:user_id]
    end
  end


end
