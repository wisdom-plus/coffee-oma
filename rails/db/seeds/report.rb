9.times do |n|
  u = User.find(n + 1)
  Report.create!(
    user: u,
    review: Review.find(1)
  )
  Report.create!(
    user: u,
    review: Review.find(2)
  )
end

puts 'Report created!'
