class OffersController < ApplicationController
  helper_method :applied?

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
      flash[:success] = "offer created"
    else
      redirect_to new_offer_path
      flash[:danger] = "error"
    end
  end

  def show
    @offer = Offer.find(params[:id]).decorate
  end

  def edit
    @offer = Offer.find(params[:id])
    @technologies = Technology.filter_skill_req_technologies(@offer)
    @levels = Level.all
    @currencies = Currency.all
    @roles = Role.all
  end

  def update
    @offer = Offer.find(params[:id])
    if @offer.update(offer_params)
      flash[:success] = "offer updated"
      redirect_to offer_path @offer
    else
      flash[:danger] = "something went wrong"
      redirect_to edit_offer_path(@offer)
    end
  end

  def index
    @offers = Offer.filter_offers(params[:search]).decorate

  end

  def destroy
    @offer = Offer.find(params[:id]).destroy
    flash[:success] = "Offer destroyed"
  end

  def applied?(offer)
    true unless current_user.applied_offers.where(id: offer.id).blank?
  end

  private
  def offer_params
    params.require(:offer).permit(:title, :description, :location, :role_id, :salary_min, :salary_max, :currency_id)
  end
end
