class UsersController < ApplicationController
  before_action :user, only: %i[show update destroy]

  def show
    render json: @user
  end

  def update
    @user.update(update_params)
    return render json: { message: I18n.t('activerecord.message.user_update') }, status: :ok if @user.valid?

    render json: { error: I18n.t('activerecord.message.user_update_fail') }, status: :unprocessable_entity
  end

  def destroy
    @user.destroy
    return render json: { error: I18n.t('activerecord.message.user_destroy_fail') },
                  status: :unprocessable_entity if @user.persisted?

    render json: { message: I18n.t('activerecord.message.user_destroy') }, status: :ok
  end

  private

  def user
    @user = User.find(params['user'].present? ? params['user']['id'] : params['id'].to_i)
  end

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
