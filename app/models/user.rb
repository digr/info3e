class AdminValidator < ActiveModel::Validator
  def validate(user)
    if user.username == 'admin'
      user.errors[:username] << 'Invalid name'
    end
  end
end

class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true, length: { minimum: 3 }, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :fullname, presence: true, length: { minimum: 3 }

    validates_with AdminValidator

    def teacher?
      teacher
    end
end
