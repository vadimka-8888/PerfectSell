class SessionsController < ApplicationController
  def new

  end

  def create
    user_params = params.require(:session)
    proposer = Proposer.find_by(email: user_params[:email])
    if !proposer.present?
      store = Store.find_by(store_email: user_params[:email])
    end
    store = Store.find_by(store_email: user_params[:email])
    if proposer.present? and proposer.password==user_params[:password]
      session[:user_id] = proposer.id
      session[:role] = "proposer"
      session[:email] = user_params[:email]
      redirect_to '/stores', notice: 'Вы вошли на сайт как продавец товара!'
    elsif store.present? and store.store_password==user_params[:password]
      session[:user_id] = store.id
      session[:role] = "store"
      session[:email] = user_params[:email]
      redirect_to '/stores', notice: 'Вы вошли на сайт как представитель магазина!'
    else
      flash[:alert] = 'Неправильные данные'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/stores', notice: 'Вы вышли из аккаунта'
  end
end
