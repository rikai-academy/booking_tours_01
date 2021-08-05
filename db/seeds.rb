99.times do |n|
  tour_name = "Tour-#{n+1}"
  description = "Very happy"
  status = true
  tour_amount = 3
  date_begin = "2021-07-30"
  date_end = "2021-07-31"
  price = 500
  Tour.create!(tour_name: tour_name,
  description: description,
  status: status,
  tour_amount: tour_amount,
  date_begin: date_begin,
  date_end: date_end,
  price: price)
  
end
# Create a main sample user.
User.create!(name: "Kiter",
             email: "kiter2509@gmail.com",
             date_of_birth: "02-11-1999",
             phone_number: "0389845000",
             address: "Hokkaido, Japan",
             password: "mypass",
             password_confirmation: "mypass",
             admin: true)
             
# Generate a bunch of additional users. 
99.times do |n| 
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               date_of_birth: "09-09-1999",
               phone_number: "0389845000",
               address: "Hokkaido, Japan",
               password: password,
               password_confirmation: password)
end
