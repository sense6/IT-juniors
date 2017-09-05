class OffersController < ApplicationController
  def new
    @offer = Offer.new
    @roles = Role.all
    @currencies = Currency.all
    @technologies = Technology.all
    @levels = Level.all { |l| l.name }
  end

  def create
    @company = current_user.company
    @offer = @company.offers.build(offer_params)
    if @offer.save
      redirect_to offer_path @offer
    else
      redirect_to new_offer_path, alert: 'error'
    end
  end

  def show
    @offer = Offer.find(params[:id]).decorate
  end

  def edit
    @offer = Offer.find(params[:id])
    @technologies = Technology.filter_skill_req_technologies(@offer)
    @levels = Level.all
  end

  def index
    @offers = Offer.filter_offers(params[:search]).decorate

  end

  def destroy
    @offer = Offer.find(params[:id]).destroy
    flash[:success] = "Offer destroyed"
  end

  private
  def offer_params
    params.require(:offer).permit(:title, :description, :location, :role_id, :salary_min, :salary_max, :currency_id)
  end
end
