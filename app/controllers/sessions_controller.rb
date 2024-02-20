class SessionsController < ApplicationController
  def new
  end

  def create
    user = Person.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.superadmin?
        render json: { message: "Connexion réussie. Redirection vers le formulaire d'inscription de l'administrateur.", redirect_to: new_registration_path }, status: :ok
      else
        render json: { message: "Connexion réussie." }, status: :ok
      end
    else
      render json: { error: "Email ou mot de passe incorrect." }, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { message: "Déconnexion réussie." }, status: :ok
  end

 
end
