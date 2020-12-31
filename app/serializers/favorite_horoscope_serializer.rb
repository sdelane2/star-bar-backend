class FavoriteHoroscopeSerializer < ActiveModel::Serializer
    attributes :user_id, :horoscope, :id

    def horoscope
        self.object.horoscope
    end
end