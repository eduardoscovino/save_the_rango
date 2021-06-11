require 'uri'
require 'faker'
require "open-uri"
require "json"
OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

products = ["apple", "pumpkin", "maracuja", "cabbage", "orange", "zucchini", "banana", "artichoke", "mango", "sweet potato", 
"strawberry", "peas", "grapes", "beetroot", "watermelon", "tomato", "lemon", "mushroom", "avocado", "eggplant", "peach", 
"cucumber", "blueberry", "corn", "pineapple", "cauliflower", "cherry", "asparagus", "pear", "broccoli", "raspberry", 
"blackberry", "celery", "plum", "garlic", "nectarine", "kiwi", "carrot", "potato", "onion"]

# create an admin user with role admin
puts "Creating users..."
if !User.find_by(email: "admin@gmail.com")
  case Rails.env
  when "development"
    User.create(email: "admin@gmail.com", password: "123456", role: "admin")
  when "production"
    User.create(email: "admin@gmail.com", password: "rangoproduction1234", role: "admin")
  end
end
puts "Users created!"

# Destroying and creating signatures
puts 'Destroying signatures...'
Signature.destroy_all

puts 'Creating signatures...'
puts 'Creating signature 1'
signature1 = Signature.create({
  title: "Veggy Choice",
  type_of: "Weekly delivery",
  price: 90,
  description: "7 sorts of vegetables of the season close to expiring "
})
file_serialized = URI.open("https://api.unsplash.com/photos/vyHo3nnk8G8?client_id=qCt2qRB46agmjH4iuGBJdLeKaWANwpnHt6tZ53ywE74").read
file_full = JSON.parse(file_serialized)
file = URI.open(file_full["urls"]["small"])
signature1.photo.attach(io: file, filename: '', content_type: 'image/png')
signature1.save

puts 'Creating signature 2'
signature2 = Signature.create({
  title: "Organic Choice",
  type_of: "Weekly delivery",
  price: 120,
  description: "4 sorts of fruits and 4 vegetables of the season organic certified producers"
})
file_serialized = URI.open("https://api.unsplash.com/photos/Y5n8mCpvlZU?client_id=qCt2qRB46agmjH4iuGBJdLeKaWANwpnHt6tZ53ywE74").read
file_full = JSON.parse(file_serialized)
file = URI.open(file_full["urls"]["small"])
signature2.photo.attach(io: file, filename: '', content_type: 'image/png')
signature2.save

puts 'Creating signature 3'
signature3 = Signature.create({
  title: "Mix of it all",
  type_of: "Weekly delivery",
  price: 150,
  description: "3 sorts of fruits, 3 vegetables, 2 cheese, 2 nuts"
})
file_serialized = URI.open("https://api.unsplash.com/photos/mIyZDPhuyY0?client_id=qCt2qRB46agmjH4iuGBJdLeKaWANwpnHt6tZ53ywE74").read
file_full = JSON.parse(file_serialized)
file = URI.open(file_full["urls"]["small"])
signature3.photo.attach(io: file, filename: '', content_type: 'image/png')
signature3.save
puts 'Finished!'

# Destroying and creating products
puts 'Destroying all products...'
Product.destroy_all

puts 'Creating 40 fake vegetables and fruits...'
products.each do |product|
  product = Product.create(
    name: product,
    expiration_date: ['2021-06-20', '2021-06-21', '2021-06-22', '2021-06-22', '2021-06-23'].sample,
    price: rand(2..8),
    available_quantity: rand(10..20)
  )
  file_serialized = URI.open("https://api.unsplash.com/search/photos?query=#{product.name}&client_id=qCt2qRB46agmjH4iuGBJdLeKaWANwpnHt6tZ53ywE74").read
  file_full = JSON.parse(file_serialized)
  file = URI.open(file_full["results"][0]["urls"]["small"])
  product.photo.attach(io: file, filename: '', content_type: 'image/png')
  product.save
end
puts 'Finished!'


# https://api.unsplash.com/photos/vyHo3nnk8G8?client_id=qCt2qRB46agmjH4iuGBJdLeKaWANwpnHt6tZ53ywE74