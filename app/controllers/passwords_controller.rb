class PasswordsController < ApplicationController
  def edit
  end

  def update
    if Current.user.update(password_params)
      flash[:success] = "Se ha actualizado la contraseña."
      redirect_to root_path
    else
      flash[:danger] = "Ocurrió un error al actualizar la contraseña."
      redirect_to edit_password_path
    end
  end

  private
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
