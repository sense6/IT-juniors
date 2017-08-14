class OffersController < ApplicationController
  def new
  end

  def create
    @offer = Offer.new
    if @offer.save
      redirect_to :root, notice: 'Offer was successfully created'
    end
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def index
    @offers = Offer.all
  end
  def destroy
    @offer = Offer.find(params[:id]).destroy
    flash[:success] = "Offer destroyed"
  end
end
