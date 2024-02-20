class Person < ApplicationRecord
    has_secure_password
    enum role: [:participant, :admin, :superadmin]

    validates :name, presence: true
    validates :email, uniqueness: true,presence: true
    validates :role, presence: true
    def self.create_session(email, password)
        user = find_by(email: email)
        return nil unless user&.authenticate(password)
    
        # Création d'une session utilisateur
        session = Session.create(user_id: user.id)
        session.token
      end
    
      # Méthode pour trouver l'utilisateur à partir du token de session
      def self.find_by_session_token(token)
        session = Session.find_by(token: token)
        session&.user
      end
end
