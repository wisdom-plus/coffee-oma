class HomeController < ApplicationController
  def top
    @rankings = Product.all.order('likes_count desc').limit(3)
    @reviews = Review.all.includes([:product], [:user]).last(3)
  end

  def private_policy; end

  def policy; end
end
