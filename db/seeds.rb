puts "Destroying all users"
User.destroy_all

puts "Creating a new user"
User.create!(name: "Giovanna", email: "t@t.com", password: "123456", address: "Rua 123")

puts "Criou um user"
