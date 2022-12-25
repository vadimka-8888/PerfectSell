class SessionsController < ApplicationController
  def new

  end

  def create
    user_params = params.require(:session)
    proposer = Proposer.find_by(email: user_params[:email])
    if proposer.present?
      session[:user_id] = proposer.id
      redirect_to '/stores', notice: 'Вы вошли на сайт!'
    else
      flash[:alert] = 'Неправильные данные'
      render :new
    end
  end
end
