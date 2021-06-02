require 'uri'
require 'faker'
require "open-uri"
require "json"
OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

# create an admin user with role admin
puts "Creating users..."
if !User.find_by(email: "admin@gmail.com")
  case Rails.env
  when "development"
    User.create!(email: "admin@gmail.com", password: "123456", role: "admin")
  when "production"
    User.create!(email: "admin@gmail.com", password: "rangoproduction1234", role: "admin")
  end
end
puts "Users created!"

# create signatures
  puts 'Creating signatures...'
Signature.create!({
  title: "Veggy Choice",
  type_of: "Weekly delivery",
  price: 90,
  description: "7 sorts of vegetables of the season close to expiring "

})
Signature.create!({
  title: "Organic Choice",
  type_of: "Weekly delivery",
  price: 120,
  description: "4 sorts of fruits and 4 vegetables of the season organic certified producers"

})
Signature.create!({
  title: "Mix of it all",
  type_of: "Weekly delivery",
  price: 150,
  description: "3 sorts of fruits, 3 vegetables, 2 cheese, 2 nuts"

})
puts 'Finished!'
# create products
puts 'Creating 20 fake vegetables...'
20.times do
  product = Product.create!(
    name: Faker::Food.vegetables,
    expiration_date: ['2021-06-20', '2021-06-21', '2021-06-22', '2021-06-22', '2021-06-23'].sample,
    price: rand(2..8),
    available_quantity: rand(10..20)
  )
  url = "https://api.unsplash.com/search/photos?query=#{product.name}&client_id=d77PusuQGAIyMMG4_Fy__3Kguy6kZ9IRW98_HTCngNc" # NÃO PRECISA SER DO CLOUDINARY
  filename = File.basename(URI.parse(url).path)
  file = URI.open(url)
  product.photo.attach(io: file, filename: filename)
  product.save!
end
puts 'Finished!'

puts 'Creating 20 fake fruits...'
20.times do
  product = Product.create!(
    name: Faker::Food.fruits,
    expiration_date: ['2021-06-20', '2021-06-21', '2021-06-22', '2021-06-22', '2021-06-23'].sample,
    price: rand(2..8),
    available_quantity: rand(10..20)
  )
  url = "https://api.unsplash.com/search/photos?query=#{product.name}&client_id=d77PusuQGAIyMMG4_Fy__3Kguy6kZ9IRW98_HTCngNc" # NÃO PRECISA SER DO CLOUDINARY
  filename = File.basename(URI.parse(url).path)
  file = URI.open(url)
  product.photo.attach(io: file, filename: filename)
  product.save!
end
puts 'Finished!'

