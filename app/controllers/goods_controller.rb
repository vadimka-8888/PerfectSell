class GoodsController < ApplicationController
  def goods
    @all_goods = Offer.all
  end

  def new

  end

  def create

  end
end
