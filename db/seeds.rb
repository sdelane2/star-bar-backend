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


signs = {"Capricorn": "December 22 - January 19", "Aquarius": "January 20 - February 18", "Pisces": "February 19 - March 20", "Aries": "March 21 - April 19", "Leo": "July 23 - August 22", "Sagittarius": "November 23 - December 21", "Gemini": "May 21 - June 20", "Virgo": "August 23 - September 22", "Libra": "September 23 - October 23", "Scorpio": "October 24 - November 22", "Cancer": "June 21 - July 22", "Taurus": "April 20 - May 20"}

Sign.destroy_all 
Horoscope.destroy_all

puts "Making signs"
signs.each do |sign, range|
    Sign.create(name: sign, date_range: range)
end

puts "making horoscopes"
signs.each do |sign, range| 
    all_horoscopes = RestClient.post("https://aztro.sameerkumar.website?sign=#{sign}&day=today", {})
    horoscope_hash = JSON.parse(all_horoscopes)
    Horoscope.create(horoscope: horoscope_hash["description"], sign_id: Sign.find_by(name: sign).id, mood: horoscope_hash["mood"], date: horoscope_hash["current_date"], lucky_number: horoscope_hash["lucky_number"], lucky_color: horoscope_hash["color"] , compatibility: horoscope_hash["compatibility"] )
end

puts "making users"

User.create(name: Faker::Name.name, birthdate: "August 4")
User.create(name: Faker::Name.name, birthdate: "March 4")
User.create(name: Faker::Name.name, birthdate: "July 4")

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


    