10.times do |n|
  Relationship.create!(
    user: User.find(n + 1),
    follow: User.find(n + 2)
  )
  Relationship.create!(
    user: User.find(n + 2),
    follow: User.find(n + 1)
  )
  next unless n != 0 && n.even?

  Relationship.create!(
    user: User.find(n + 1),
    follow: User.find(1)
  )
end

puts 'Relationship created!'
