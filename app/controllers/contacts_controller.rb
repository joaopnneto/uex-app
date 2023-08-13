class ContactsController < ApplicationController
  before_action :contact, only: %i[show update destroy]

  def index
    render json: Contact.all
  end

  def show
    render json: @contact
  end

  def create
    @contact = Contact.create(contact_params)
    return render json: { message: I18n.t('activerecord.message.contact_success') }, status: :created if @contact.valid?

    render json: { error: @contact.errors }, status: :unprocessable_entity
  end

  def update
    @contact.update(contact_params)
    return render json: { message: I18n.t('activerecord.message.contact_update') }, status: :ok if @contact.valid?

    render json: { error: I18n.t('activerecord.message.contact_update_fail') }, status: :unprocessable_entity
  end

  def destroy
    @contact.destroy
    return render json: { error: I18n.t('activerecord.message.contact_destroy_fail') }, status: :unprocessable_entity if @contact.persisted?

    render json: { message: I18n.t('activerecord.message.contact_destroy') }, status: :ok
  end

  private

  def contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.permit(
      :name, :cpf, :phone, :user_id,
      address_attributes: [:street, :number, :complement,
                           :neighborhood, :zip_code, :city, :uf, { coordinate_attributes: %i[latitude longitude] }]
    )
  end
end
