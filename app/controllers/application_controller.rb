class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_user
    Current.user
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:danger] = "No tiene permisos para acceder a esta página."
    redirect_to root_path
  end

  def require_user_not_logged_in!
    if Current.user != nil
      flash[:success] = "Ya ha iniciado sesión."
      redirect_to root_path
    end
  end
end
