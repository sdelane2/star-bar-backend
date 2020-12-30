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

signs = {
    "Capricorn": (Date.new(2020, 12, 22)...Date.new(2021, 1, 19)), 
    "Aquarius": (Date.new(2020, 1, 20)...Date.new(2020, 2, 18)),
     "Pisces": (Date.new(2020, 2, 19)...Date.new(2020, 3, 20)), 
     "Aries": (Date.new(2020, 3, 21)...Date.new(2020, 4, 19)), 
     "Leo": (Date.new(2020, 7, 23)...Date.new(2020, 8, 22)), 
     "Sagittarius": (Date.new(2020, 11, 23)...Date.new(2020, 12, 21)), 
     "Gemini": (Date.new(2020, 5, 21)...Date.new(2020, 6, 20)), 
     "Virgo": (Date.new(2020, 8, 23)...Date.new(2020, 9, 22)), 
     "Libra": (Date.new(2020, 9, 23)...Date.new(2020, 10, 23)), 
     "Scorpio": (Date.new(2020, 10, 24)...Date.new(2020, 11, 22)), 
     "Cancer": (Date.new(2020, 6, 21)...Date.new(2020, 7, 22)), 
     "Taurus": (Date.new(2020, 4, 20)...Date.new(2020, 5, 20))
    }

Sign.destroy_all 
Horoscope.destroy_all

puts "Making signs"
signs.each do |sign, range|
    Sign.create(name: sign, duration: range)
end

puts "making horoscopes"
signs.each do |sign, range| 
    all_horoscopes = RestClient.post("https://aztro.sameerkumar.website?sign=#{sign}&day=today", {})
    horoscope_hash = JSON.parse(all_horoscopes)
    Horoscope.create!(description: horoscope_hash["description"], mood: horoscope_hash["mood"], date: horoscope_hash["current_date"], lucky_number: horoscope_hash["lucky_number"], lucky_color: horoscope_hash["color"] , compatibility: horoscope_hash["compatibility"] )
end

puts "making users"

User.create(name: Faker::Name.name, birthdate: Date.new(1988, 8, 4), username: "sean", password: "sean")
User.create(name: Faker::Name.name, birthdate: Date.new(1993, 3, 4), username: "moose", password: "sean")
User.create(name: Faker::Name.name, birthdate: Date.new(2010, 6, 14), username: "basil", password: "sean")

puts "making favorites"

10.times do 
    FavoriteHoroscope.create(user_id: User.all.sample.id, horoscope_id: Horoscope.all.sample.id)
end

# Horoscope.create(horoscope: "test", mood: "test")

# def get_horoscopes
#     horoscope_array = []
#     all_horoscopes = RestClient.post("https://aztro.sameerkumar.website?sign=leo&day=today", {})
#     horoscope_hash = JSON.parse(all_horoscopes)
#     # binding.pry
#     # horoscope_array << horoscope_hash["items"]

    
#     Horoscope.create!(horoscope: horoscope_hash["description"], sign_id: 1, mood: horoscope_hash["mood"])

# #     horoscope_hash.each do |horoscope|
# #         Horoscope.create(
# #             horoscope: horoscope["horoscope"]
            
# #         )
# #     end
# end

# get_horoscopes


    