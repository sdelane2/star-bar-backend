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
    "Capricorn": [(Date.new(2020, 12, 22)...Date.new(2021, 1, 19)), 'https://cdn.pixabay.com/photo/2018/03/16/16/42/signs-of-the-zodiac-3231771_1280.png'], 
    "Aquarius": [(Date.new(2020, 1, 20)...Date.new(2020, 2, 18)), 'https://cdn.pixabay.com/photo/2018/03/16/16/37/signs-of-the-zodiac-3231753_1280.png'],
     "Pisces": [(Date.new(2020, 2, 19)...Date.new(2020, 3, 20)), 'https://cdn.pixabay.com/photo/2018/03/16/16/38/signs-of-the-zodiac-3231760_1280.png'], 
     "Aries": [(Date.new(2020, 3, 21)...Date.new(2020, 4, 19)), 'https://cdn.pixabay.com/photo/2018/03/16/16/41/signs-of-the-zodiac-3231766_1280.png'], 
     "Leo": [(Date.new(2020, 7, 23)...Date.new(2020, 8, 22)), 'https://cdn.pixabay.com/photo/2018/03/16/16/40/signs-of-the-zodiac-3231765_1280.png'], 
     "Sagittarius": [(Date.new(2020, 11, 23)...Date.new(2020, 12, 21)), 'https://cdn.pixabay.com/photo/2018/03/16/16/37/signs-of-the-zodiac-3231754_1280.png'], 
     "Gemini": [(Date.new(2020, 5, 21)...Date.new(2020, 6, 20)), 'https://cdn.pixabay.com/photo/2018/03/16/16/44/signs-of-the-zodiac-3231780_1280.png'], 
     "Virgo": [(Date.new(2020, 8, 23)...Date.new(2020, 9, 22)), 'https://cdn.pixabay.com/photo/2018/03/16/16/42/signs-of-the-zodiac-3231770_1280.png'], 
     "Libra": [(Date.new(2020, 9, 23)...Date.new(2020, 10, 23)), 'https://cdn.pixabay.com/photo/2018/03/16/16/38/signs-of-the-zodiac-3231761_1280.png'], 
     "Scorpio": [(Date.new(2020, 10, 24)...Date.new(2020, 11, 22)), 'https://cdn.pixabay.com/photo/2018/03/16/16/43/signs-of-the-zodiac-3231779_1280.png'], 
     "Cancer": [(Date.new(2020, 6, 21)...Date.new(2020, 7, 22)), 'https://cdn.pixabay.com/photo/2018/03/16/16/42/signs-of-the-zodiac-3231776_1280.png'], 
     "Taurus": [(Date.new(2020, 4, 20)...Date.new(2020, 5, 20)), 'https://cdn.pixabay.com/photo/2018/03/16/16/39/signs-of-the-zodiac-3231763_1280.png']
    }

puts "Destroying signs"
Sign.destroy_all 
puts "Destroying Horoscopes"
Horoscope.destroy_all
# puts "Destroying users"
# User.destroy_all 
puts "Destroying Favorite Horoscopes"
FavoriteHoroscope.destroy_all

puts "Making signs"
signs.each do |sign, range|
    Sign.create(name: sign, duration: range[0], image: range[1])
end

puts "making horoscopes"
signs.each do |sign, range| 
    all_horoscopes = RestClient.post("https://aztro.sameerkumar.website?sign=#{sign}&day=today", {})
    horoscope_hash = JSON.parse(all_horoscopes)
    Horoscope.create!(description: horoscope_hash["description"], mood: horoscope_hash["mood"], current_date: horoscope_hash["current_date"], lucky_number: horoscope_hash["lucky_number"], lucky_color: horoscope_hash["color"] , compatibility: horoscope_hash["compatibility"] )
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


    