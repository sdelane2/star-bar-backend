class User < ApplicationRecord
    has_many :favorite_horoscopes
    has_many :horoscopes, through: :favorite_horoscopes
    has_secure_password

    def birthday
        if self.birthdate.mon == 1 && self.birthdate.mday <= 19
            Date.new(2021, self.birthdate.mon, self.birthdate.mday)
        else
            Date.new(2020, self.birthdate.mon, self.birthdate.mday)
        end
    end
end
