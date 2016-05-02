

User.create!(name:  "Admin User",
             email: "admin@gmail.com",
             password:              "admin123456",
             password_confirmation: "admin123456",
             admin: true,
             latitude: +30.211573,
             longitude: -92.031394,
             category: "admin",
             commodity: 0)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  admin = false
  latitude = +19.765432 
  longitude = -80.987654 
  category = "Buyer"
  commodity = 0
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               latitude: latitude,
               longitude: longitude,
               category: category,
               admin: admin,
               commodity: commodity)
end