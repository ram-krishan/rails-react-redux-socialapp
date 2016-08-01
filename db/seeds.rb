# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(first_name: 'Ram', last_name: 'patidar', password: '12345678', email: 'ram@yopmail.com', image: '../app/assets/images/ram.png')
User.create!(first_name: 'Vijay', last_name: 'chouhan', password: '12345678', email: 'vijay@yopmail.com', image: '../app/assets/images/vijay.jpeg')