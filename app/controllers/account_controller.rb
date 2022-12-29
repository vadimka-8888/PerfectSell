class AccountController < ApplicationController
  def index
    if current_user.present?
      if session[:role]=="proposer"
        @offers = Offer.select{|o| o.proposer_id==current_user.id}
      end
    end
  end
end
