12.times do |n|
  name = Faker::Internet.unique.username
  email = Faker::Internet.unique.email
  password = Faker::Internet.password
  User.create!(email: email,
               password: password,
               username: name,
               confirmed_at: Time.zone.now,
               icon: File.open("./public/seed/icon-#{n + 1}.png"))
end

puts 'User created'
