class HoroscopeSerializer < ActiveModel::Serializer
    attributes :id, :current_date, :description, :lucky_number, :lucky_color, :mood, :compatibility, :sign 

    def sign
        self.object.sign.name
    end
end

