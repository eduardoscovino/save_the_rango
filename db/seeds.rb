# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# create an admin user with role admin
puts "Creating users..."
if !User.find_by(email: "")
  case Rails.env
  when "development"
    User.create!(email: "", password: "123456", role: "admin")
  when "production"
    User.create!(email: "", password: "", role: "admin")
  end
end
puts "Users created!"

# create signatures
# create products