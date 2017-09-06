class CompaniesController < ApplicationController
  load_and_authorize_resource
  def new
    @company = Company.new
  end

  def create
    @company = current_user.build_company(company_params)
    if @company.save
      redirect_to company_path @company
    else
      redirect_to users_path
    end
  end

  def show
    @company = Company.find(params[:id]).decorate
    @c = Company.find(params[:id])
    @o = @c.offers
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
      redirect_to company_path
    else
      render :edit
    end
  end

  private

  def company_params
    params.require(:company).permit(:name,:description,:address,:phone,:nip,:krs,:web_page,:email)
  end
end
