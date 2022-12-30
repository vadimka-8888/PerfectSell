class TestController < ApplicationController
  def test
    @all_people = Proposer.all
    @all_people.each do |p|
      puts p.full_name
    end
    @all_offers = Offer.all
    @all_stores = Store.all
  end

  def test2
    @shop = Store.create(store_params)
    @shop.save
    puts store_params
    redirect_to "/test"
  end

  private def store_params
    params.require(:store).permit(:name, :address, :description, :store_email, :store_password);
  end
end
