class RegistrationsController < Devise::RegistrationsController
  def create
    new_user = User.create(sign_up_params)
    return render json: { message: 'Usuário criado com sucesso' } if new_user.valid?

    render json: { error: new_user.errors }, status: :unprocessable_entity
  end

  private

  def sign_up_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
