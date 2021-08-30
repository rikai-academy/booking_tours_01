# Create a main sample user.
User.create!(name: "Kiter",
             email: "kiter2509@gmail.com",
             date_of_birth: "02-11-1999",
             phone_number: "0389845000",
             address: "Hokkaido, Japan",
             password: "mypass",
             password_confirmation: "mypass",
             admin: true)
