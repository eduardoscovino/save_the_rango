# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
