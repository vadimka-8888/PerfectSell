class ApplicationController < ActionController::Base
  helper_method :current_user
  private
  def current_user
    @current_user = Proposer.find_by(email: session[:email]) if session[:email]
    if @current_user.nil?
      @current_user = Store.find_by(store_email: session[:email]) if session[:email]
    end
  end
end
