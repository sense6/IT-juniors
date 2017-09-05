class SkillsRequirementController < ApplicationController
  def create
    @skills_requirement = SkillsRequirement.new(offer_id: params[:offer_id],technology_id: params[:technology_id], level_id: 6)
    if @skills_requirement.save
      redirect_to edit_offer_path params[:offer_id]
      flash[:success] = "skill requirement created"
    end
  end

  def destroy
    @skills_requirement = SkillsRequirement.find(params[:skills_requirement_id])
    @skills_requirement.destroy
    redirect_to edit_offer_path params[:offer_id]
  end

  def update
    @skills_requirement = SkillsRequirement.find(params[:skills_requirement_id])
    if @skills_requirement.update(level_id: params[:level_id])
      flash[:success] = "skill req updated"
      redirect_to edit_offer_path params[:offer_id]
    end
  end
end
