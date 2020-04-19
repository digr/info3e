class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true, length: { minimum: 5 }, uniqueness: true
    validates :password, presence: true, length: { minimum: 5 }
end
