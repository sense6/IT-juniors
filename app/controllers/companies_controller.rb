class CompaniesController < ApplicationController
  load_and_authorize_resource
  def new
    @company = Company.new
  end

  def create
    @company = Company.new
    if @company.save
      redirect_to request.referrer
    end
  end

  def show
    @company = Company.find(params[:id]).decorate
  end

  def index
    @companies = Company.all
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @comapny = Company.find(params[:id])
    if @company.update(company_params)
      flash[:success] = "edited"
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def company_params
    params.require(:company).permit(:address,:phone,:nip,:krs,:web_page)
  end
end
