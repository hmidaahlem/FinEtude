class RegistrationController < ApplicationController
  before_action :authenticate_superadmin, only: [:create]

  def new
    @admin = Person.new
  end

  def create
    @admin = Person.new(admin_params)
    @admin.role = :admin

    if @admin.save
      # Envoyer les données de connexion par email à l'admin nouvellement créé
   AdminMailer.new_admin_email(@admin).deliver_now

      render json: { message: "L'administrateur a été créé avec succès." }, status: :created
    else
      render json: { errors: @admin.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def admin_params
    params.require(:person).permit(:name, :email, :password, :password_confirmation)
  end

  def authenticate_superadmin
    superadmin_id = params[:superadmin_id]
  end
end
