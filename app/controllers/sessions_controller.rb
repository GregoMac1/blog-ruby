class SessionsController < ApplicationController
  before_action :require_user_not_logged_in!, except: [:destroy]
  
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:danger] = "Correo electrónico o contraseña inválidos."
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Se ha cerrado la sesión."
    redirect_to root_path
  end
end
