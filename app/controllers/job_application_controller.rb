class JobApplicationController < ApplicationController
  def create
    @job_application = JobApplication.create(user_id: current_user.id, offer_id: params[:offer_id])
    if @job_application.save
      redirect_to offer_path params[:offer_id]
      flash[:success] = "successfully applied"
    else
      redirect_to offer_path params[:offer_id]
      flash[:danger] = "could not apply for this offer"
    end
  end

  def destroy
    @job_application.find(params[:id])
    @job_application.destroy
  end
end
