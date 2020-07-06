class User < ApplicationRecord
    has_many :hikes
    has_many :trails, through: :hikes
    has_many :comments
    has_secure_password
    validates :username, uniqueness: true
end
