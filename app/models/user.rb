class User < ApplicationRecord
    has_many :favorite_horoscopes
    has_many :horoscopes, through: :favorite_horoscopes
    has_secure_password
end
