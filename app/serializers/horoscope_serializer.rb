class HoroscopeSerializer < ActiveModel::Serializer
    attributes :id, :current_date, :description, :lucky_number, :lucky_color, :mood, :compatibility
end

