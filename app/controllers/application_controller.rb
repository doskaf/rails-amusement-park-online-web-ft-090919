class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :login_required, :current_user

  def login_required
    redirect_to root_path if !session.include? :user_id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
