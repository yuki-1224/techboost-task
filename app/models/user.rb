class User < ApplicationRecord
    has_secure_password
    
    # 正規表現
    EMAIL_REGULAR = /\A([^@\s]+)@.*\..*\z/
    PASS_REGULAR = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,32}+\z/
    validates :name, presence: true, length: {maximum: 15}
    validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGULAR}
    validates :password, presence: true, format: { with: PASS_REGULAR}
end
