class ContactsController < ApplicationController
  before_action :contact, only: %i[show update destroy]

	def index
		render json: Contact.all
	end

  def show
    render json: @contact
  end

  def create
    @contact = Contact.create(contact_params.merge(user_id: 1))
    return render json: { message: 'Usuário criado com sucesso' }, status: :created if @contact.valid?

    render json: { error: @contact.errors }, status: :unprocessable_entity
  end

  def update
    @contact.update(contact_params)
    return render json: { message: 'Contato atualizado' }, status: :ok if @contact.valid?

    render json: { error: 'Erro ao realizar a atualização ' }, status: :unprocessable_entity
  end

  def destroy
    @contact.destroy
    return render json: { error: 'Deu ruim meu chapa' }, status: :unprocessable_entity if @manifest.persisted?

    render json: { message: 'Sucesso' }, status: :ok
  end

  private

  def contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.permit(
      :name, :cpf, :phone
      # coordinate_attributes: %i[latitude longitude],
      # address_attributes: %i[street number complement zip_code city uf country]
    )
  end
end
