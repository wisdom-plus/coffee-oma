class HomeController < ApplicationController
  def top
    @news = News.latest_news
    @reviews = ReviewDecorator.decorate_collection(Review.latest_review)
  end

  def private_policy; end

  def policy; end
end
