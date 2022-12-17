class TestController < ApplicationController
  def test
    @all_people = Proposer.all
    @all_people.each do |p|
      puts p.full_name
    end
    @all_offers = Offer.all
    @all_stores = Store.all
  end
end
