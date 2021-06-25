class HomeController < ApplicationController
  def top
    @rankings = Product.like_top
    @reviews = Review.latest_review
  end

  def private_policy; end

  def policy; end
end
