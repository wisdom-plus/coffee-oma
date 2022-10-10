class HomeController < ApplicationController
  def top
    @rankings = Product.includes([:image_attachment]).like_top
    @reviews = Review.latest_review
    @news = News.latest_news
  end

  def private_policy; end

  def policy; end
end
