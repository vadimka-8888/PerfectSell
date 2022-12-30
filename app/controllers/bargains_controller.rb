class BargainsController < ApplicationController
  before_action :get_offer, :get_user
  skip_before_action :verify_authenticity_token
  def get_offer
    @offer = Offer.find(params[:offer_id])
  end

  def get_user
    @store = Store.find(current_user.id)
  end

  def new
    @bargain = @store.bargains.create(:status=>"Considering", :offer => @offer,:date => Date.today)
    @bargain.save
    redirect_to @offer
  end
  def create

  end

  def destroy
      @bargain = Bargain.find(params[:id])
      @bargain.destroy
      redirect_to @offer
  end

  def edit
    if session[:role]=="store"
      #сделки с данным товаром
      @bargain = @store.bargains.find_by(id:params[:id])
      if @bargain.status=="Considering"
        @bargain.status = "Accepted"
        @bargain.save
        redirect_to @offer
      else
        @offer = Offer.find(params[:offer_id])
        @bargain = Bargain.new
        @bargain.store_id = current_user.id
        @bargain.offer_id = params[:id]
        @bargain.status="Considering"
        @bargain.save
        redirect_to @offer
      end
    end
  end
end
