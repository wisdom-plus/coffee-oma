class HomeController < ApplicationController
  def top
    @news = News.latest_news
  end

  def private_policy; end

  def policy; end
end
