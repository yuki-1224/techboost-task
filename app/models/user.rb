class User < ApplicationRecord
    validates :name, presence: true, length: {maximum: 15}
    validates :email, presence: true, uniqueness: true, format: { with: /\A.*@.*\..\z/}
    
    has_secure_password
    validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-z\d]{8,32}+\z/i}
end
