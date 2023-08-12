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
    return render json: { message: 'Contato criado com sucesso' }, status: :created if @contact.valid?

    render json: { error: @contact.errors }, status: :unprocessable_entity
  end

  def update
    @contact.update(contact_params)
    return render json: { message: 'Contato atualizado com sucesso' }, status: :ok if @contact.valid?

    render json: { error: 'Erro ao realizar a atualização' }, status: :unprocessable_entity
  end

  def destroy
    @contact.destroy
    return render json: { error: 'Erro ao realizar a exclusão' }, status: :unprocessable_entity if @contact.persisted?

    render json: { message: 'Contato excluído com sucesso' }, status: :ok
  end

  private

  def contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.permit(
      :name, :cpf, :phone,
      address_attributes: [:street, :number, :complement,
                           :neighborhood, :zip_code, :city, :uf, { coordinate_attributes: %i[latitude longitude] }]
    )
  end
end
