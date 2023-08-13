class UsersController < ApplicationController
  before_action :user, only: %i[show update destroy]

  def show
    render json: @user
  end

  def update
    @user.update(user_params) if @user.valid_password?(params['password'])
    return render json: { message: I18n.t('activerecord.message.user_update') }, status: :ok if @user.valid?

    render json: { error: I18n.t('activerecord.message.user_update_fail') }, status: :unprocessable_entity
  end

  def destroy
    @user.destroy if @user.valid_password?(params['password'])
    return render json: { error: I18n.t('activerecord.message.user_destroy_fail') }, status: :unprocessable_entity if @user.persisted?

    render json: { message: I18n.t('activerecord.message.user_destroy') }, status: :ok
  end

  private

  def user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
