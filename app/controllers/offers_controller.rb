class OffersController < ApplicationController

  def index
    @all_offers = Offer.all
  end

  def new

  end
  def upload
    file_field = @params['form']['file'] rescue nil

    # file_field is a StringIO object
    file_field.content_type # 'text/csv'
    file_field.full_original_filename
  end
  def show
    @offer = Offer.find(params[:id])
  end

  def create
    @offer = Offer.create(offer_params)
    @offer.save
    redirect_to @offer
  end

  private def offer_params
    params.require(:offer).permit(:name, :measure, :price, :description,:is_active,:photo)
  end

end