puts "Destroying all users"
User.destroy_all
Category.destroy_all

Category.create!(name:"Strenght")
Category.create!(name:"Running")
Category.create!(name:"Personal Fight")
Category.create!(name:"Hit Cardio")

puts "Creating a new user"
User.create!(name: "Giovanna", email: "t@t.com", password: "123456", address: "Rua Mourato Coelho, 1404")

puts "Creating a new trainning"
# Trainning.create!(description:"xxx", duration:"15min", address:"Rua Hum, 123", user: User.last, category: Category.first)
puts "Created new trainning"

puts "Criou um user"
