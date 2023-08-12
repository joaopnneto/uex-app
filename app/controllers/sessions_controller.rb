class SessionsController < Devise::SessionsController
  before_action :find_user, only: %i[create]

  def create
    if @user.valid_password?(params['password'])
      sign_in @user
      render json: { current_user: @user }, status: :created
    else
      render json: { error: 'Credenciais inválidas' }, status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find_by_email(params['email'])
  end

  def respond_to_on_destroy
    head :ok
  end
end
