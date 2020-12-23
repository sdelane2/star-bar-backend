# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'json'
require 'faker'
require 'pry'



# Horoscope.create(horoscope: "test", mood: "test")

def get_horoscopes
    horoscope_array = []
    all_horoscopes = RestClient.post("https://aztro.sameerkumar.website?sign=leo&day=today", {})
    horoscope_hash = JSON.parse(all_horoscopes)
    # binding.pry
    # horoscope_array << horoscope_hash["items"]

    Sign.create(name: "Libra")
    Horoscope.create!(horoscope: horoscope_hash["description"], sign_id: 1, mood: horoscope_hash["mood"])

#     horoscope_hash.each do |horoscope|
#         Horoscope.create(
#             horoscope: horoscope["horoscope"]
            
#         )
#     end
end

get_horoscopes


    