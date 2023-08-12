class UsersController < ApplicationController
  before_action :user, only: %i[show update destroy]

  def show
    render json: @user
  end

  def update
    @user.update(user_params) if @user.valid_password?(params['password'])
    return render json: { message: 'Usuário atualizado com sucesso' }, status: :ok if @user.valid?

    render json: { error: 'Erro ao atualizar os dados' }, status: :unprocessable_entity
  end

  def destroy
    @user.destroy if @user.valid_password?(params['password'])
    return render json: { error: 'Erro ao realizar a exclusão' }, status: :unprocessable_entity if @user.persisted?

    render json: { message: 'Usuário excluído com sucesso' }, status: :ok
  end

  private

  def user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
