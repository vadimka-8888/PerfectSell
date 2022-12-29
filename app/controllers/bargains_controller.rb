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
    redirect_to '/offers'
  end
  def create

  end

  def destroy
      @bargain = Bargain.find(params[:id])
      @bargain.destroy
      redirect_to '/offers'
  end

  def update
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
end
