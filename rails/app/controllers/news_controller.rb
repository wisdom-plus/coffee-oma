class NewsController < ApplicationController
  before_action :authenticate_admin_user!, only: %i[new create edit update destroy]
  before_action :find_news, only: %i[edit update destroy]

  def index
    @news_all = News.all
  end

  def new
    @news = News.new
  end

  def create
    @news = current_admin_user.news.create(news_params)
    if @news.save
      redirect_to root_path, notice: t('.notice')
    else
      flash.now[:alert] = t('.alert')
      render :new
    end
  end

  def show
    @news = News.find_by(id: params[:id])
    if @news.publicshed?
      @news.activate unless @news.active
    else
      redirect_to root_path, alert: t('.alert')
    end
  end

  def edit; end

  def update
    if @news.update(news_params)
      redirect_to root_path, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    if @news.destroy
      redirect_to root_path, notice: t('.notice')
    else
      redirect_to root_path, alert: t('.alert')
    end
  end

  private

    def news_params
      params.require(:news).permit(:title, :content, :active, :publicshed_at)
    end

    def find_news
      @news = News.find_by(id: params[:id])
    end
end
