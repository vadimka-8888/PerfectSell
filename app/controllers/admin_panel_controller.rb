class AdminPanelController < ApplicationController
  def new

  end

  def create
    user_params = params.require(:admin_panel)
    @admins = AdminUser.all
    @user = @admins.find_by(email: user_params[:email])
    if @user.present?
      redirect_to '/admin'
    else
      flash[:alert] = 'Неправильные данные'
      render :new
    end
  end
end
