class Person < ApplicationRecord
    has_secure_password
    enum role: [:participant, :admin, :superadmin]

    validates :name, presence: true
    validates :email, uniqueness: true,presence: true
    validates :role, presence: true
end
