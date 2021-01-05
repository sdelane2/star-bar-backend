class FavoriteHoroscope < ApplicationRecord
    belongs_to :user 
    belongs_to :horoscope

    validates :user_id, uniqueness: { scope: :horoscope_id }
end
