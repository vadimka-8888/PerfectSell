class AccountController < ApplicationController
  def index
    @offers = Offer.select{|o| o.proposer_id==current_user.id}
  end
end
