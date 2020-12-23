class Horoscope < ApplicationRecord
    has_many :favorite_horoscopes
    has_many :users, through: :favorite_horoscopes
    belongs_to :sign
end
