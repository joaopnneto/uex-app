class RegistrationsController < Devise::RegistrationsController
  def create
    new_user = User.create(sign_up_params)
    return render json: { message: I18n.t('activerecord.message.user_created') } if new_user.valid?

    render json: { error: new_user.errors }, status: :unprocessable_entity
  end

  private

  def sign_up_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
