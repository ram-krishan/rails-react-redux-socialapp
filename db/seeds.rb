# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ffaker'

User.create(first_name: 'Ram', last_name: 'patidar', password: '12345678', email: 'ram@yopmail.com', image: '../app/assets/images/ram.png')
User.create(first_name: 'Vijay', last_name: 'chouhan', password: '12345678', email: 'vijay@yopmail.com', image: '../app/assets/images/vijay.jpeg')

Post.destroy_all

30.times do |t|
  display_src = ["https://scontent.cdninstagram.com/hphotos-xap1/t51.2885-15/e35/12552326_495932673919321_1443393332_n.jpg", "https://scontent.cdninstagram.com/hphotos-xaf1/t51.2885-15/e35/12407344_1283694208323785_735653395_n.jpg", "https://scontent.cdninstagram.com/hphotos-xpf1/t51.2885-15/e35/923995_1704188643150533_1383710275_n.jpg", "https://scontent.cdninstagram.com/hphotos-xap1/t51.2885-15/e35/12407480_1654828594805097_152207166_n.jpg"].sample

  title = "#{rand(100..1000000)} this is title"
  description = "#{rand(100..1000000)} #{FFaker::Lorem.paragraph}"

  Post.create(title: title, description: description, user_id: User.all.sample.id, display_src: display_src )
  puts "created #{t}"
end

Post.first(3).each do |post|
  post.comments.create(comment: post.id.to_s + " : " + FFaker::Lorem.paragraph)
end