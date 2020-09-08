
puts "Destroying all users"
User.destroy_all
Category.destroy_all

Category.create!(name:"Strenght", image_url: "https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80")
Category.create!(name:"Running", image_url: "https://images.unsplash.com/photo-1540539234-c14a20fb7c7b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80")
Category.create!(name:"Personal Fight", image_url: "https://images.unsplash.com/photo-1583187856683-dddad0e87f79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80" )
Category.create!(name:"Hit Cardio", image_url: "https://images.unsplash.com/photo-1480264104733-84fb0b925be3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80" )

puts "Creating a new user"


User.create!(name: "Giovanna", email: "t@t.com", password: "123456", address: "Rua 123")
giovana = User.last

puts "Creating a profile"
Profile.create!(speciality:"personal", age:"40", bio:"Im from NYC", certifications:"NYU college", achievments:"Personal of the year", user: giovana)
puts "criou profile"

puts "Creating a new trainning"
# Trainning.create!(description:"xxx", duration:"15min", address:"Rua Hum, 123", user: User.last, category: Category.first)
puts "Created new trainning"

puts "Criou um user"
