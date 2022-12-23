class ShopsController < ApplicationController
  def mainpage
    @all_shops = Store.all
  end

  def new

  end

  def show
    @shop = Store.find(params[:id])
  end
  def create
    @shop = Store.create(shop_params)
    @shop.save
    redirect_to @shop
  end

  private def shop_params
    params.require(:shop).permit(:name, :address, :description, :store_email,:photo)
  end

end
