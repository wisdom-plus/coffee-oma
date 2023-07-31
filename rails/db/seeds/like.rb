10.times do |n|
  if n != 0 && n.even?
    ProductLike.create!(
      user: User.find(n + 1),
      liked_id: 1
    )
    BeanLike.create!(
      user: User.find(n + 1),
      liked_id: 1
    )
  end
  ProductLike.create!(
    user: User.find(n + 1),
    liked_id: n + 1
  )
  ProductLike.create!(
    user: User.find(n + 2),
    liked_id: n + 1
  )
  BeanLike.create!(
    user: User.find(n + 1),
    liked_id: n + 1
  )
  BeanLike.create!(
    user: User.find(n + 2),
    liked_id: n + 1
  )
  if n < 6
    ProductReviewLike.create!(
      user: User.find(n + 3),
      liked_id: 1
    )
    BeanReviewLike.create!(
      user: User.find(n + 3),
      liked_id: 1
    )
  end
  ProductReviewLike.create!(
    user: User.find(n + 1),
    liked_id: n + 1
  )
  BeanReviewLike.create!(
    user: User.find(n + 1),
    liked_id: n + 1
  )
end

puts 'Like created!'
