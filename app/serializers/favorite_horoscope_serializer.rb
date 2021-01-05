class FavoriteHoroscopeSerializer < ActiveModel::Serializer
    attributes :user_id, :horoscope, :id, :sign

    def horoscope
        self.object.horoscope
    end

    def sign
        self.object.horoscope.sign.name
    end
end