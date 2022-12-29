class AccountController < ApplicationController
  def index
    if current_user.present?
      if session[:role]=="proposer"
        @offers = Offer.select{|o| o.proposer_id==current_user.id}
      end
    end
  end

  def show_acc
    if session[:role] =="store"
      @bargains = current_user.bargains.select{|b|b.status=="Accepted"}
      @offers=[]
      @bargains.each { |n|
        @offers.append(Offer.find_by(id:n.offer_id))
      }
    end
  end

  def show_cons
    if session[:role] =="store"
      @bargains = current_user.bargains.select{|b|b.status=="Considering"}
      @offers=[]
      @bargains.each { |n|
        @offers.append(Offer.find_by(id:n.offer_id))
      }
    end
  end
end
