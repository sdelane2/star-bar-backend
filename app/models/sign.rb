class Sign < ApplicationRecord
    

    def self.find_sign(date)
        self.all.find do |sign|
            sign.duration.include?(date)
        end.name
    end
end
