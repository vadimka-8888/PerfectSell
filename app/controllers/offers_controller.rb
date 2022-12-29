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
    @bargain = current_user.bargains.find_by(offer_id: @offer.id)
    @offers_of_proposer = Offer.select{|o| o.proposer_id==current_user.id}
    @is_belongs = @offers_of_proposer.include?@offer
    if session[:role]=="store"
      #сделки с данным товаром
      @bargains = Bargain.select{|b| b.offer_id==params[:id]}
    end

  end

  def change_status
    if session[:role]=="store"
      #сделки с данным товаром
      @all_bargains = Bargain.select{|b| b.offer_id==params[:id]}
      @this_bargain_exists = @all_bargains.select{|b| b.store_id = current_user.id}
      if @this_bargain_exists.present?
        @barg = @this_bargain_exists[0]
        @barg.status = "Accepted"
        @barg.save
        redirect_to @offer
      else
        @offer = Offer.find(params[:id])
        @bargain = Bargain.new
        @bargain.store_id = current_user.id
        @bargain.offer_id = params[:id]
        @bargain.status="Considering"
        @bargain.save
        redirect_to @offer
      end
    end
  end
  def delete_bargain
    if session[:role]=="store"
      @bargain = Bargain.select{|b| b.offer_id==params[:id] &b.store_id = current_user.id}
      @bargain.destroy
    else

    end
  end


  def create_bargain
    @offer = Offer.find(params[:id])
    @bargain = Bargain.new
    @bargain.store_id = current_user.id
    @bargain.offer_id = params[:id]
    @bargain.status="Considering"
    @bargain.save
    redirect_to @offer
  end

  def create
    @offer = Offer.create(offer_params)
    @offer.proposer_id=current_user.id
    @offer.save
    redirect_to @offer
  end

  private def offer_params
    params.require(:offer).permit(:name, :measure, :price, :description,:is_active,:photo)
  end

end