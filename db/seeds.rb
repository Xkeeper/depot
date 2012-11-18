# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all

Product.create( title: "Ruby programming",
                description: %{ <p>ruby programming book </p>},
                image_url: 'http://piter.com/upload/covers_bitrix_b/44610110.jpg', price: 49.95)
