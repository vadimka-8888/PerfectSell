class StoresController < ApplicationController

  def index
    @all_stores = Store.all
  end

  def new

  end

  def show
    @store = Store.find(params[:id])
  end

  def create
    @store = Store.create(store_params)
    @store.save
    redirect_to @store
  end

  private def store_params
    params.require(:store).permit(:name, :address, :description, :store_email,:store_password,:photo)
  end

end