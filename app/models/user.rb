class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    def self.authenticate_with_credentials(email, password)
        normalized_email = email.strip.downcase
        user = User.find_by(email: normalized_email)
        if user && user.authenticate(password)
            user
        else
            nil
        end
    end
end
