class ApplicationController < ActionController::Base

  def current_account
    @current_account ||= Account.find_by(id: session[:account_id])
  end

  def check_auth
    redirect_to sign_up_path unless current_account
  end
end
